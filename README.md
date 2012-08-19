# GC::Video

Parse and consume video links

    gem 'video'

### Usage

    link = GC::Video.new "http://www.youtube.com/watch?v=t9LMOydfc4k&feature=related"

    link.id
    => t9LMOydfc4k

    link.provider
    => :youtube

    link.embed('560x315') =>
    <iframe width="560" height="315" src="http://www.youtube.com/embed/t9LMOydfc4k&html5=1" frameborder="0" allowfullscreen></iframe>
