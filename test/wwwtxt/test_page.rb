require "test_helper"

class TestPage < Minitest::Test

  def constant_fetcher
    Class.new do
      const_set "FORMAT", "txt"

      def self.page(url)
        WwwTxt::Page.new(title, content)
      end

      def self.title
        "My title"
      end

      def self.content
        <<EOF
        <p>body par 1</p>
        <p>body par 2</p>
EOF
      end
    end
  end

  def test_title
    page = constant_fetcher.page("http://example.com")
    assert_equal page.title, "My title"
  end

  def test_body
    page = constant_fetcher.page("http://example.com")
    assert_equal page.body, "body par 1\n\nbody par 2"
  end
end
