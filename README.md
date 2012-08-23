# GC::Video

Parse and consume video links

    gem 'video'

### Usage

Only youtube links are supported so far

    link = GC::Video.new "http://www.youtube.com/watch?v=t9LMOydfc4k&feature=related"

    link.id => "t9LMOydfc4k"

    link.provider => :youtube

    link.thumbnail => "//img.youtube.com/vi/t9LMOydfc4k/default.jpg"
    link.thumbnail(:full) => "//img.youtube.com/vi/t9LMOydfc4k/0.jpg"

    link.embed('560x315', autoplay: true)
     => <iframe width="560" height="315"
                src="http://www.youtube.com/embed/t9LMOydfc4k&html5=1&autoplay=1"
                frameborder="0" allowfullscreen>
        </iframe>

    link.embed('560x315', load: false, thumbnail: :full, attr1: 'value1')
     => <iframe width="560" height="315"
                data-src="http://www.youtube.com/embed/t9LMOydfc4k&html5=1"
                data-attr1="value1"
                data-thumbnail="//img.youtube.com/vi/t9LMOydfc4k/0.jpg"
                frameborder="0" allowfullscreen>
        </iframe>
