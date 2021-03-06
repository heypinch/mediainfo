require 'forwardable'
require 'net/http'
require 'mediainfo/errors'
require 'mediainfo/tracks'
require 'mediainfo/string'

module MediaInfo

  # Allow user to set custom mediainfo_path with ENV['MEDIAINFO_PATH']
  def self.location
    ENV['MEDIAINFO_PATH'].nil? ? mediainfo_location = '/usr/local/bin/mediainfo' : mediainfo_location = ENV['MEDIAINFO_PATH']
    raise EnvironmentError, "#{mediainfo_location} cannot be found. Are you sure mediainfo is installed?" unless ::File.exist? mediainfo_location
    return mediainfo_location
  end

  # Allow collection of MediaInfo version details
  def self.version
    version ||= `#{location} --Version`[/v([\d.]+)/, 1]
    # Ensure MediaInfo isn't buggy and returns something
    raise UnknownVersionError, 'Unable to determine mediainfo version. ' + "We tried: #{location} --Version." +
          'Set MediaInfo.path = \'/full/path/of/mediainfo\' if it is not in your PATH.' unless version
    # Ensure you're not using an old version of MediaInfo
    if version < '0.7.25'
      raise IncompatibleVersionError, "Your version of mediainfo, #{version}, " +
          'is not compatible with this gem. >= 0.7.25 required.'
    else
      @version = version
    end

  end

  def self.xml_parser
    ENV['MEDIAINFO_XML_PARSER'].nil? || ENV['MEDIAINFO_XML_PARSER'].to_s.strip.empty? ? xml_parser = 'rexml/document' : xml_parser = ENV['MEDIAINFO_XML_PARSER']
    begin
      require xml_parser
    rescue Gem::LoadError => ex
      raise Gem::LoadError, "Your specified XML parser, #{xml_parser.inspect}, could not be loaded: #{ex.message}"
    end
    return xml_parser
  end

  def self.run(input = nil)
    raise ArgumentError, 'Your input cannot be blank.' if input.nil?
    command = "#{location} #{input} --Output=XML 2>&1"
    return IO.popen(command).read
  end

  def self.from(input)
    return from_uri(input) if input.is_a?(URI)
    return from_string(input) if input.is_a?(String)
    raise BadInputError
  end

  def self.from_string(input)
    return from_xml(input) if input.include?('<?xml')
    return from_link(input) if input =~ URI::regexp('http') # match only http URI schemes

    # If nothing else matches, treat as a local file
    # User can validate whether or not has audio or video
    # with media_info_obj.audio or media_info_obj.video
    return from_local_file(input)
  end

  def self.from_xml(input)
    MediaInfo::Tracks.new(input)
  end

  def self.from_local_file(input)
    absolute_path = File.expand_path(input) # turns relative to absolute path

    raise ArgumentError, 'You must include a file location.' if absolute_path.nil?
    raise ArgumentError, "need a path to a video file, #{absolute_path} does not exist" unless File.exist?(absolute_path)

    return from_xml(File.open(absolute_path).read) if absolute_path.match(/[^\\]*\.(xml)$/)
    MediaInfo::Tracks.new(MediaInfo.run(absolute_path.shell_escape_double_quotes))
  end

  def self.from_link(input)
    from_uri(URI(input))
  end

  def self.from_uri(input)
    http = Net::HTTP.new(input.host, input.port) # Check if input is valid
    request = Net::HTTP::Head.new(input.request_uri) # Only grab the Headers to be sure we don't try and download the whole file

    http.use_ssl = true if input.is_a? URI::HTTPS # For https support

    raise RemoteUrlError, "HTTP call to #{input} is not working!" unless http.request(request).is_a?(Net::HTTPOK)

    MediaInfo::Tracks.new(MediaInfo.run(URI.escape(input.to_s)))
  end

  def self.set_singleton_method(object,name,parameters)
    # Handle parameters with invalid characters (instance_variable_set throws error)
    name.gsub!('.','_') if name.include?('.') ## period in name
    name.downcase!
    # Create singleton_method
    object.instance_variable_set("@#{name}",parameters)
    object.define_singleton_method name do
      object.instance_variable_get "@#{name}"
    end
  end

end # end Module
