require 'test_helper'

class RegisterUsersControllerTest < ActionController::TestCase
  setup do
    @register_user = register_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:register_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create register_user" do
    assert_difference('RegisterUser.count') do
      post :create, register_user: {  }
    end

    assert_redirected_to register_user_path(assigns(:register_user))
  end

  test "should show register_user" do
    get :show, id: @register_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @register_user
    assert_response :success
  end

  test "should update register_user" do
    patch :update, id: @register_user, register_user: {  }
    assert_redirected_to register_user_path(assigns(:register_user))
  end

  test "should destroy register_user" do
    assert_difference('RegisterUser.count', -1) do
      delete :destroy, id: @register_user
    end

    assert_redirected_to register_users_path
  end
end
