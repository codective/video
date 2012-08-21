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

    def embed dim='560x315', options={}
      options[:load] = true if options[:load].nil?
      h,w = dim.split('x')
      if youtube?
        @embed = %(<iframe width="#{h}" height="#{w}" #{options[:load] ? 'src' : 'data-src'}="http://www.youtube.com/embed/#{id}?html5=1")
        options.each do | k,v|
          next if k == :load
          @embed += %( data-#{k}="#{v}")
        end
        @embed += %( frameborder="0" allowfullscreen></iframe>)
      end
    end

    def thumbnail size=:default
      "//img.youtube.com/vi/#{id}/#{size == :full ? '0' : 'default'}.jpg" if youtube?
    end
  end
end
