require 'test_helper'

class AusersControllerTest < ActionController::TestCase
  setup do
    @auser = ausers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ausers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auser" do
    assert_difference('Auser.count') do
      post :create, auser: { password_digest: @auser.password_digest, username: @auser.username }
    end

    assert_redirected_to auser_path(assigns(:auser))
  end

  test "should show auser" do
    get :show, id: @auser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @auser
    assert_response :success
  end

  test "should update auser" do
    put :update, id: @auser, auser: { password_digest: @auser.password_digest, username: @auser.username }
    assert_redirected_to auser_path(assigns(:auser))
  end

  test "should destroy auser" do
    assert_difference('Auser.count', -1) do
      delete :destroy, id: @auser
    end

    assert_redirected_to ausers_path
  end
end
