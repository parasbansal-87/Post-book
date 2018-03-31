require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
  	@base_title = "Ruby on Rails Post-Book App"
    assert_equal full_title				, "Ruby on Rails Post-Book App"
    assert_equal full_title("Help")		, "Help | #{@base_title}"
    assert_equal full_title("About")	, "About | #{@base_title}"
    assert_equal full_title("Contact")	, "Contact | #{@base_title}"
    assert_equal full_title("Home")		, "Home | #{@base_title}"
    assert_equal full_title("Sign up")	, "Sign up | #{@base_title}"
  end
end