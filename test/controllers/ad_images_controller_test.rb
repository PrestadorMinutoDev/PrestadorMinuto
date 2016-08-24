require 'test_helper'

class AdImagesControllerTest < ActionController::TestCase
  setup do
    @ad_image = ad_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ad_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ad_image" do
    assert_difference('AdImage.count') do
      post :create, ad_image: {  }
    end

    assert_redirected_to ad_image_path(assigns(:ad_image))
  end

  test "should show ad_image" do
    get :show, id: @ad_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ad_image
    assert_response :success
  end

  test "should update ad_image" do
    patch :update, id: @ad_image, ad_image: {  }
    assert_redirected_to ad_image_path(assigns(:ad_image))
  end

  test "should destroy ad_image" do
    assert_difference('AdImage.count', -1) do
      delete :destroy, id: @ad_image
    end

    assert_redirected_to ad_images_path
  end
end
