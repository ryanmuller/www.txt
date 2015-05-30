require "readability"
require "open-uri"

module WwwTxt
  class UrlFetcher
    def self.page(url)
      new(url).page
    end

    def initialize(url)
      @url = url
      @document = Readability::Document.new(open(@url).read)
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
