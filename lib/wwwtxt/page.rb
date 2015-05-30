module WwwTxt
  class Page
    attr_reader :title
    attr_reader :body

    def initialize(title, html_body, renderer=PlainTextRenderer)
      @title = title
      @body = renderer.render_from_html(html_body)
    end
  end
end
