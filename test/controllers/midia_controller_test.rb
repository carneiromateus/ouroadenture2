require 'test_helper'

class MidiaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @midium = midia(:one)
  end

  test "should get index" do
    get midia_url
    assert_response :success
  end

  test "should get new" do
    get new_midium_url
    assert_response :success
  end

  test "should create midium" do
    assert_difference('Midium.count') do
      post midia_url, params: { midium: {  } }
    end

    assert_redirected_to midium_url(Midium.last)
  end

  test "should show midium" do
    get midium_url(@midium)
    assert_response :success
  end

  test "should get edit" do
    get edit_midium_url(@midium)
    assert_response :success
  end

  test "should update midium" do
    patch midium_url(@midium), params: { midium: {  } }
    assert_redirected_to midium_url(@midium)
  end

  test "should destroy midium" do
    assert_difference('Midium.count', -1) do
      delete midium_url(@midium)
    end

    assert_redirected_to midia_url
  end
end
