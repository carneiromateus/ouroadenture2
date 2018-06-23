require 'test_helper'

class EditalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @edital = editals(:one)
  end

  test "should get index" do
    get editals_url
    assert_response :success
  end

  test "should get new" do
    get new_edital_url
    assert_response :success
  end

  test "should create edital" do
    assert_difference('Edital.count') do
      post editals_url, params: { edital: {  } }
    end

    assert_redirected_to edital_url(Edital.last)
  end

  test "should show edital" do
    get edital_url(@edital)
    assert_response :success
  end

  test "should get edit" do
    get edit_edital_url(@edital)
    assert_response :success
  end

  test "should update edital" do
    patch edital_url(@edital), params: { edital: {  } }
    assert_redirected_to edital_url(@edital)
  end

  test "should destroy edital" do
    assert_difference('Edital.count', -1) do
      delete edital_url(@edital)
    end

    assert_redirected_to editals_url
  end
end
