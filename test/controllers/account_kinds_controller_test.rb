require 'test_helper'

class AccountKindsControllerTest < ActionController::TestCase
  setup do
    @account_kind = account_kinds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_kinds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_kind" do
    assert_difference('AccountKind.count') do
      post :create, account_kind: { name: @account_kind.name }
    end

    assert_redirected_to account_kind_path(assigns(:account_kind))
  end

  test "should show account_kind" do
    get :show, id: @account_kind
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account_kind
    assert_response :success
  end

  test "should update account_kind" do
    patch :update, id: @account_kind, account_kind: { name: @account_kind.name }
    assert_redirected_to account_kind_path(assigns(:account_kind))
  end

  test "should destroy account_kind" do
    assert_difference('AccountKind.count', -1) do
      delete :destroy, id: @account_kind
    end

    assert_redirected_to account_kinds_path
  end
end
