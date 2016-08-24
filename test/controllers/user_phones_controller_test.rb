require 'test_helper'

class UserPhonesControllerTest < ActionController::TestCase
  setup do
    @user_phone = user_phones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_phones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_phone" do
    assert_difference('UserPhone.count') do
      post :create, user_phone: {  }
    end

    assert_redirected_to user_phone_path(assigns(:user_phone))
  end

  test "should show user_phone" do
    get :show, id: @user_phone
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_phone
    assert_response :success
  end

  test "should update user_phone" do
    patch :update, id: @user_phone, user_phone: {  }
    assert_redirected_to user_phone_path(assigns(:user_phone))
  end

  test "should destroy user_phone" do
    assert_difference('UserPhone.count', -1) do
      delete :destroy, id: @user_phone
    end

    assert_redirected_to user_phones_path
  end
end
