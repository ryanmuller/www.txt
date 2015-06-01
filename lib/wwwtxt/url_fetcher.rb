require "readability"
require "open-uri"
require "open_uri_redirections"

module WwwTxt
  class UrlFetcher
    def self.page(url)
      new(url).page
    end

    def initialize(url)
      @url = url
      @document = Readability::Document.new(open(@url, :allow_redirections => :safe).read)
    end

    def page
      WwwTxt::Page.new(title, content)
    end

    def title
      @document.title ||
        @url.split("/")[-1]
    end

    def content
      @document.content
    end
  end
end
