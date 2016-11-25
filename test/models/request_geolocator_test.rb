# frozen_string_literal: true

require 'test_helper'

class RequestGeolocatorTest < ActionView::TestCase
  test 'suggests location from ip address' do
    suggestion = RequestGeolocator.new('74.125.225.224').suggest

    assert_equal 'Mountain View, California, Estados Unidos',
                 suggestion.fullname
  end

  test 'suggests properly translated locations' do
    I18n.with_locale(:en) do
      suggestion = RequestGeolocator.new('74.125.225.224').suggest
      assert_equal 'Mountain View, California, United States', suggestion.fullname
    end
  end

  test "does not suggests a location unless it's city-specific" do
    assert_nil \
      RequestGeolocator.new(ip_from_brazil_but_not_a_specific_city).suggest
  end

  private

  def ip_from_brazil_but_not_a_specific_city
    '179.168.191.163'
  end
end
