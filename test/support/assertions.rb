# frozen_string_literal: true
module Minitest
  #
  # Custom Minitest assertions
  #
  module Assertions
    def assert_link(name)
      assert has_link?(name, exact: true), assert_error_for('a', name)
    end

    def refute_link(name)
      msg = "Link '#{name}' was found in page's html: #{html}"
      refute has_link?(name, exact: true), msg
    end

    def assert_content(text)
      msg = "Content '#{text}' was not found in page's content: '#{text}'"
      assert has_content?(text), msg
    end

    def refute_content(text)
      msg = "Content '#{text}' was found in page's content: '#{text}'"
      refute has_content?(text), msg
    end

    def assert_css_selector(selector, text:)
      assert has_selector?(selector, text: text),
             assert_error_for(selector, text)
    end

    private

    def assert_error_for(selector, text)
      found = find_all(selector)

      if found.empty?
        "Selector '#{selector}' was not found in page's html: '#{html}'"
      else
        <<~MSG.squish
          #{pluralize(found.size, 'instance')} of selector '#{selector}' were
          found, but none of them contained '#{text}'. Instead, they had content
          #{found.map { |f| "'#{f.text}'" }.join(', ')}, respectively.
        MSG
      end
    end

    def pluralize(count, name)
      s = count == 1 ? '' : 's'

      "#{count} #{name}#{s}"
    end
  end
end
