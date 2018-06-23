require 'test_helper'

class ConectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conection = conections(:one)
  end

  test "should get index" do
    get conections_url
    assert_response :success
  end

  test "should get new" do
    get new_conection_url
    assert_response :success
  end

  test "should create conection" do
    assert_difference('Conection.count') do
      post conections_url, params: { conection: {  } }
    end

    assert_redirected_to conection_url(Conection.last)
  end

  test "should show conection" do
    get conection_url(@conection)
    assert_response :success
  end

  test "should get edit" do
    get edit_conection_url(@conection)
    assert_response :success
  end

  test "should update conection" do
    patch conection_url(@conection), params: { conection: {  } }
    assert_redirected_to conection_url(@conection)
  end

  test "should destroy conection" do
    assert_difference('Conection.count', -1) do
      delete conection_url(@conection)
    end

    assert_redirected_to conections_url
  end
end
