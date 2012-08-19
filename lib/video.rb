require "video/version"
require 'uri'

module GC
  class Video
    attr_accessor :id, :uri, :provider, :params

    def initialize link
      @link = link
      @uri = URI(@link)
      @provider = case @uri.host
                  when /youtube.com/ then :youtube
                  end
      @params = Hash[*@uri.query.split('&').map { |kv| sp = kv.split('='); sp[0] = sp[0].to_sym; sp }.flatten]
    end

    def id
      params[:v] if youtube?
    end

    def youtube?
      provider == :youtube
    end

    def embed dim='560x315'
      h,w = dim.split('x')
      %(<iframe width="#{h}" height="#{w}" src="http://www.youtube.com/embed/#{id}&html5=1" frameborder="0" allowfullscreen></iframe>) if youtube?
    end

  end
end
