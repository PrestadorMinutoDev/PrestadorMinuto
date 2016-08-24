require 'test_helper'

class AccountResourcesControllerTest < ActionController::TestCase
  setup do
    @account_resource = account_resources(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_resources)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_resource" do
    assert_difference('AccountResource.count') do
      post :create, account_resource: { parameter: @account_resource.parameter }
    end

    assert_redirected_to account_resource_path(assigns(:account_resource))
  end

  test "should show account_resource" do
    get :show, id: @account_resource
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account_resource
    assert_response :success
  end

  test "should update account_resource" do
    patch :update, id: @account_resource, account_resource: { parameter: @account_resource.parameter }
    assert_redirected_to account_resource_path(assigns(:account_resource))
  end

  test "should destroy account_resource" do
    assert_difference('AccountResource.count', -1) do
      delete :destroy, id: @account_resource
    end

    assert_redirected_to account_resources_path
  end
end
