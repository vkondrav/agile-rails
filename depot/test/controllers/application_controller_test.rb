require "test_helper"
require "timecop"

class ApplicationControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get store_index_url
    assert_response :success
  end

  test "date is valid" do
    Timecop.freeze(Time.local(2024, 9, 29, 0, 0, 0))

    get store_index_path
    assert_select "h2", "September 29, 2024"
  end

end
