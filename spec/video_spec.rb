require 'spec_helper'

describe GC::Video do

  let(:video) { GC::Video.new 'http://www.youtube.com/watch?v=t9LMOydfc4k&feature=related' }

  it 'parses the link' do
    video.uri.should be
    video.uri.scheme.should == 'http'
    video.uri.host.should == 'www.youtube.com'
  end

  it 'parses for a provider symbol' do
    video.provider.should == :youtube
    video.should be_youtube
  end

  it 'converts the query string into a hash' do
    video.params.should include(v: 't9LMOydfc4k', feature:'related')
  end

  it 'looks for a video id' do
    video.id.should == 't9LMOydfc4k'
  end

  it 'outputs provider recommended code to embed' do
    video.embed('1024x768').should == %(<iframe width="1024" height="768" src="http://www.youtube.com/embed/t9LMOydfc4k?html5=1" frameborder="0" allowfullscreen></iframe>)
  end

  it 'outputs provider recommended code without the src attribute' do
    video.embed('1024x768', load: false).should == %(<iframe width="1024" height="768" data-src="http://www.youtube.com/embed/t9LMOydfc4k?html5=1" frameborder="0" allowfullscreen></iframe>)
  end
end

