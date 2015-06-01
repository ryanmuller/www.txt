module WwwTxt
  class Page
    attr_reader :title
    attr_reader :body

    def initialize(title, html_body, renderer=PlainTextRenderer)
      @title = title
      @file_name = clean_title(title)
      @body = renderer.render_from_html(html_body)
      @format = renderer::FORMAT
    end

    def save(path)
      path = File.expand_path(File.join(path, "#{@file_name}.#{@format}"))
      File.open(path, "w") do |f|
        f << @body
      end
    end

    private

    def clean_title(title)
      title.
        downcase.
        gsub(/\s/, "-").
        gsub(/[^-a-z0-9]/, "").
        gsub(/\-\-+/, "-")
    end
  end
end
