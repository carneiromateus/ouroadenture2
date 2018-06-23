require 'test_helper'

class FeirasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feira = feiras(:one)
  end

  test "should get index" do
    get feiras_url
    assert_response :success
  end

  test "should get new" do
    get new_feira_url
    assert_response :success
  end

  test "should create feira" do
    assert_difference('Feira.count') do
      post feiras_url, params: { feira: {  } }
    end

    assert_redirected_to feira_url(Feira.last)
  end

  test "should show feira" do
    get feira_url(@feira)
    assert_response :success
  end

  test "should get edit" do
    get edit_feira_url(@feira)
    assert_response :success
  end

  test "should update feira" do
    patch feira_url(@feira), params: { feira: {  } }
    assert_redirected_to feira_url(@feira)
  end

  test "should destroy feira" do
    assert_difference('Feira.count', -1) do
      delete feira_url(@feira)
    end

    assert_redirected_to feiras_url
  end
end
