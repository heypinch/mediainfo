## Important information regarding changes:
This version no longer checks for file extensions. Thus, the developer must check themselves.
For audio or video files, you can check for the presence of an `audio` or `video` attribute on the `MediaInfo` object returned. Below we can see the differences between a .txt file import and a mp4 import without the mp4 file extension.

##### MP4 file
```
#<MediaInfo::Tracks:0x007fcc56369578 @xml="<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<MediaInfo\n    xmlns=\"https://mediaarea.net/mediainfo\"\n    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n    xsi:schemaLocation=\"https://mediaarea.net/mediainfo https://mediaarea.net/mediainfo/mediainfo_2_0.xsd\"\n    version=\"2.0\">\n<creatingLibrary version=\"18.08.1\" url=\"https://mediaarea.net/MediaInfo\">MediaInfoLib</creatingLibrary>\n<media ref=\"speech\">\n<track type=\"General\">\n<UniqueID>327570572949802445968353936761818399903</UniqueID>\n<VideoCount>1</VideoCount>\n<AudioCount>1</AudioCount>\n<Format>Matroska</Format>\n<Format_Version>4</Format_Version>\n<FileSize>18334819</FileSize>\n<Duration>135.581</Duration>\n<OverallBitRate>1081852</OverallBitRate>\n<FrameRate>25.000</FrameRate>\n<FrameCount>3387</FrameCount>\n<IsStreamable>Yes</IsStreamable>\n<File_Modified_Date>UTC 2018-08-23 10:36:39</File_Modified_Date>\n<File_Modified_Date_Local>2018-08-23 20:36:39</File_Modified_Date_Local>\n<Encoded_Application>Lavf57.83.100</Encoded_Application>\n<Encoded_Library>Lavf57.83.100</Encoded_Library>\n<extra>\n<ErrorDetectionType>Per level 1</ErrorDetectionType>\n<FileExtension_Invalid>mkv mk3d mka mks</FileExtension_Invalid>\n</extra>\n</track>\n<track type=\"Video\">\n<StreamOrder>0</StreamOrder>\n<ID>1</ID>\n<UniqueID>1</UniqueID>\n<Format>VP9</Format>\n<CodecID>V_VP9</CodecID>\n<Duration>135.480000000</Duration>\n<Width>1920</Width>\n<Height>1080</Height>\n<PixelAspectRatio>1.000</PixelAspectRatio>\n<DisplayAspectRatio>1.778</DisplayAspectRatio>\n<FrameRate_Mode>CFR</FrameRate_Mode>\n<FrameRate>25.000</FrameRate>\n<FrameCount>3387</FrameCount>\n<ColorSpace>YUV</ColorSpace>\n<Language>en</Language>\n<Default>Yes</Default>\n<Forced>No</Forced>\n<colour_range>Limited</colour_range>\n<colour_description_present>Yes</colour_description_present>\n<colour_primaries>BT.709</colour_primaries>\n<transfer_characteristics>BT.709</transfer_characteristics>\n<matrix_coefficients>BT.709</matrix_coefficients>\n</track>\n<track type=\"Audio\">\n<StreamOrder>1</StreamOrder>\n<ID>2</ID>\n<UniqueID>2</UniqueID>\n<Format>AAC</Format>\n<Format_AdditionalFeatures>LC</Format_AdditionalFeatures>\n<CodecID>A_AAC-2</CodecID>\n<Duration>135.581000000</Duration>\n<Channels>2</Channels>\n<ChannelPositions>Front: L R</ChannelPositions>\n<ChannelLayout>L R</ChannelLayout>\n<SamplesPerFrame>1024</SamplesPerFrame>\n<SamplingRate>44100</SamplingRate>\n<SamplingCount>5979122</SamplingCount>\n<FrameRate>43.066</FrameRate>\n<Compression_Mode>Lossy</Compression_Mode>\n<Delay>0.000</Delay>\n<Delay_Source>Container</Delay_Source>\n<Language>en</Language>\n<Default>Yes</Default>\n<Forced>No</Forced>\n</track>\n</media>\n</MediaInfo>\n\n", @track_types=["general", "video", "audio"], @attribute_standardization_rules={"Bit_rate"=>"Bitrate", "Bitrate_mode"=>"Bitrate_mode", "Bit_rate_mode"=>"Bitrate_mode", "Overallbitrate"=>"Overall_bitrate", "Overall_bit_rate"=>"Overall_bitrate", "File_size"=>"Filesize", "Stream_size"=>"Streamsize", "Frame_rate"=>"Framerate", "Frame_rate_mode"=>"Framerate_mode", "Maximum_frame_rate"=>"Maximum_framerate", "Displayaspectratio"=>"Display_aspect_ratio", "Pixelaspectratio"=>"Pixel_aspect_ratio"}, @general=#<MediaInfo::Tracks::Attributes:0x007fcc5906a180 @uniqueid=327570572949802445968353936761818399903, @videocount=1, @audiocount=1, @format="Matroska", @format_version=4, @filesize=18334819, @duration=135581, @overallbitrate=1081852, @framerate="25.000", @framecount=3387, @isstreamable="Yes", @file_modified_date=2018-08-23 10:36:39 +1000, @file_modified_date_local=2018-08-23 20:36:39 +1000, @encoded_application="Lavf57.83.100", @encoded_library="Lavf57.83.100", @extra=#<MediaInfo::Tracks::Attributes::Extra:0x007fcc562db980 @errordetectiontype="Per level 1", @fileextension_invalid="mkv mk3d mka mks">, @count=1>, @video=#<MediaInfo::Tracks::Attributes:0x007fcc562d2bc8 @uniqueid=1, @format="VP9", @duration="135.480000000", @framerate="25.000", @framecount=3387, @streamorder=0, @id=1, @codecid="V_VP9", @width=1920, @height=1080, @pixelaspectratio="1.000", @displayaspectratio=1.778, @framerate_mode="CFR", @colorspace="YUV", @language="en", @default="Yes", @forced="No", @colour_range="Limited", @colour_description_present="Yes", @colour_primaries="BT.709", @transfer_characteristics="BT.709", @matrix_coefficients="BT.709", @count=1>, @audio=#<MediaInfo::Tracks::Attributes:0x007fcc59083a40 @uniqueid=2, @format="AAC", @duration="135.581000000", @framerate=43.066, @streamorder=1, @id=2, @codecid="A_AAC-2", @language="en", @default="Yes", @forced="No", @format_additionalfeatures="LC", @channels=2, @channelpositions="Front: L R", @channellayout="L R", @samplesperframe=1024, @samplingrate=44100, @samplingcount=5979122, @compression_mode="Lossy", @delay="0.000", @delay_source="Container", @count=1>>
```

##### TXT file
```
#<MediaInfo::Tracks:0x007fcc5908a688 @xml="<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<MediaInfo\n    xmlns=\"https://mediaarea.net/mediainfo\"\n    xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n    xsi:schemaLocation=\"https://mediaarea.net/mediainfo https://mediaarea.net/mediainfo/mediainfo_2_0.xsd\"\n    version=\"2.0\">\n<creatingLibrary version=\"18.08.1\" url=\"https://mediaarea.net/MediaInfo\">MediaInfoLib</creatingLibrary>\n<media ref=\"prices.txt\">\n<track type=\"General\">\n<FileExtension>txt</FileExtension>\n<FileSize>542</FileSize>\n<StreamSize>542</StreamSize>\n<File_Modified_Date>UTC 2018-12-19 00:19:50</File_Modified_Date>\n<File_Modified_Date_Local>2018-12-19 10:19:50</File_Modified_Date_Local>\n</track>\n</media>\n</MediaInfo>\n\n", @track_types=["general"], @attribute_standardization_rules={"Bit_rate"=>"Bitrate", "Bitrate_mode"=>"Bitrate_mode", "Bit_rate_mode"=>"Bitrate_mode", "Overallbitrate"=>"Overall_bitrate", "Overall_bit_rate"=>"Overall_bitrate", "File_size"=>"Filesize", "Stream_size"=>"Streamsize", "Frame_rate"=>"Framerate", "Frame_rate_mode"=>"Framerate_mode", "Maximum_frame_rate"=>"Maximum_framerate", "Displayaspectratio"=>"Display_aspect_ratio", "Pixelaspectratio"=>"Pixel_aspect_ratio"}, @general=#<MediaInfo::Tracks::Attributes:0x007fcc562aa4e8 @filesize=542, @file_modified_date=2018-12-19 00:19:50 +1000, @file_modified_date_local=2018-12-19 10:19:50 +1000, @count=1, @fileextension="txt", @streamsize=542>>
```

<hr>

# MediaInfo [![Build Status](https://travis-ci.org/greatseth/mediainfo.svg?branch=master)](https://travis-ci.org/greatseth/mediainfo)

MediaInfo is a class wrapping [the mediainfo CLI](http://mediainfo.sourceforge.net).

## Installation

    $ gem install mediainfo

## Usage

#### Parsing raw XML
    media_info = MediaInfo.from(File.open('iphone6+_video.mov.xml').read)
#### Handling a local file
    media_info = MediaInfo.from('~/Desktop/test.mov')
#### Handling a URL
    media_info = MediaInfo.from('http://techslides.com/demos/sample-videos/small.mp4')

You can specify an alternate path for the MediaInfo Binary:

    ENV['MEDIAINFO_PATH'] = "/opt/local/bin/mediainfo"

Once you have an MediaInfo object, you can start inspecting tracks:

    media_info.track_types       => ['general','video','audio']
    media_info.track_types.count => 3
    media_info.video?            => true
    media_info.image?            => nil
    media_info.image.filesize    => MethodNotFound exception

When inspecting specific types of tracks, you have a couple general API options. The
first approach assumes one track of a given type, a common scenario in many video files,
for example:

    media_info.video.count    => 1
    media_info.video.duration => 120 (seconds)

Sometimes you'll have more than one track of a given type:
 - The first track type name, or any track type with <ID>1</ID> will not contain '1'


        media_info.track_types                => ['general','video','video2','audio','other','other2']
        media_info.track_types.count          => 5
        media_info.video?                     => true
        media_info.image?                     => nil
        media_info.video.count                => 1
        media_info.video.duration             => 29855000
        media_info.video.display_aspect_ratio => 1.222
        media_info.other.count                => 2
        media_info.video2.duration            => 29855000

- Note that the above automatically converts MediaInfo Strings into Time, Integer, and Float objects:


        media_info.video.encoded_date.class         => Time
        media_info.video2.duration.class            => Integer
        media_info.video.display_aspect_ratio.class => Float

- Any track attribute name with "date" and matching /\d-/ will be converted using Time.parse:


        media_info.video.encoded_date => 2018-03-30 12:12:08 -0400
        media_info.video.customdate   => 2016-02-10 01:00:00 -0600

- .duration and .overall_duration will be returned as milliseconds AS LONG AS the Duration and Overall_Duration match one of the expected units (each separated by a space or not):
    - h (\<Duration>15h\</Duration>) (hour)
    - hour (\<Duration>15hour\</Duration>)
    - mn (\<Duration>15hour 6mn\</Duration>) (minute)
    - m (\<Duration>15hour 6m\</Duration>) (minute)
    - min (\<Duration>15hour 6min\</Duration>) (minute)
    - s (\<Duration>15hour 6min 59s\</Duration>) (second)
    - sec (\<Duration>15hour 6min 59sec\</Duration>) (second)
    - ms (\<Duration>15hour 6min 59sec 301ms\</Duration>) (milliseconds)
    - in the form of a Float (as for iphone mov files)
    - [Submit an issue to add more!](https://github.com/greatseth/mediainfo/issues)


            media_info.video.duration => 15164 (\<Duration>15s 164ms\</Duration>)
            media_info.video.duration => 36286 (\<Duration>36s 286ms\</Duration>)
            media_info.video.duration => 123456 (\<Duration>123.456\</Duration>)

- We standardize the naming of several Attributes:
    - You can review lib/attribute_standardization_rules.yml to see them all


            media_info.video.bit_rate => nil (\<Bit_rate>41.2 Mbps\</Bit_rate>)
            media_info.video.bitrate => "41.2 Mbps" (\<Bit_rate>41.2 Mbps\</Bit_rate>)
            media_info.general.filesize => "11.5 MiB" (\<File_size>11.5 MiB\</File_size>


In order to support all possible MediaInfo variations, you may see the following situation:

    media_info.track_types => ['general','video','video5','audio','other','other2']

The track type media_info.video5 is available, but no video2, 3, and 4. This is because the MediaInfo from the video has:

    <track type="Video">
        <ID>1</ID>
        ...
    <track type="Video">
        <ID>5</ID>
        ...

*The ID will take priority for labeling.* Else if no ID exists, you'll see consecutive numbering for duplicate tracks in the Media.

Any second level attributes are also available:

    MediaInfo.from('~/Desktop/test.mov').general.extra
    => #<MediaInfo::Tracks::Attributes::Extra:0x00007fa89f13aa98
     @com_apple_quicktime_creationdate=2018-03-30 08:12:08 -0400,
     @com_apple_quicktime_location_iso6709="+39.0286-077.3958+095.957/",
     @com_apple_quicktime_make="Apple",
     @com_apple_quicktime_model=0,
     @com_apple_quicktime_software=11.2>

REXML is used as the XML parser by default. If you'd like, you can
configure Mediainfo to use Nokogiri instead:

  * define the `MEDIAINFO_XML_PARSER` environment variable to be the
    name of the parser as you'd pass to a :gem or :require call.

    e.g. `export MEDIAINFO_XML_PARSER=nokogiri`

Once you've got an instance setup, you can call numerous methods to get
a variety of information about a file. Some attributes may be present
for some files where others are not, but any supported attribute
should at least return `nil`.

## Requirements

* Gem version 1.0.0 has been tested on v18.03.1
* Gem versions < 1.0.0 require at least: MediaInfoLib v0.7.25
* Gem versions <= 0.5.1 worked against MediaInfoLib v0.7.11, which did not generate XML output, and is no longer supported.

## Contributors

* Seth Thomas Rasmussen -
  [http://github.com/greatseth](http://github.com/greatseth)
* Peter Vandenberk      - [http://github.com/pvdb](http://github.com/pvdb)
* Ned Campion           - [http://github.com/nedcampion](http://github.com/nedcampion)
* Daniel Jagszent       - [http://github.com/d--j](http://github.com/d--j)
* Robert Mrasek         - [http://github.com/derobo](http://github.com/derobo)
* Nathan Pierce         - [http://github.com/NorseGaud](http://github.com/NorseGaud)
