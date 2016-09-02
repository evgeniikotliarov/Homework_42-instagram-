require 'test_helper'

class InstapostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get instaposts_new_url
    assert_response :success
  end

  test "should get show" do
    get instaposts_show_url
    assert_response :success
  end

  test "should get index" do
    get instaposts_index_url
    assert_response :success
  end

end
