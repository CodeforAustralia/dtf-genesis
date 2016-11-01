
require "#{Rails.root}/lib/scrapers/scraper_utils.rb"

class PagesControllerTest < ActionDispatch::IntegrationTest

  test "find_between finds text" do
    assert_match "between", find_between("pre between post", "pre ", " post")
  end

  test "find_between fails if no post-text" do
    assert_match "", find_between("pre betwe", "pre ", " post")
  end

  test "find_between fails if no pre-text" do
    assert_match "", find_between("tween post", "pre ", " post")
  end

end
