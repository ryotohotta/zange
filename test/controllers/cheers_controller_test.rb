require 'test_helper'

class CheersControllerTest < ActionController::TestCase
  setup do
    @cheer = cheers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cheers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cheer" do
    assert_difference('Cheer.count') do
      post :create, cheer: { article_id: @cheer.article_id, user_id: @cheer.user_id }
    end

    assert_redirected_to cheer_path(assigns(:cheer))
  end

  test "should show cheer" do
    get :show, id: @cheer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cheer
    assert_response :success
  end

  test "should update cheer" do
    patch :update, id: @cheer, cheer: { article_id: @cheer.article_id, user_id: @cheer.user_id }
    assert_redirected_to cheer_path(assigns(:cheer))
  end

  test "should destroy cheer" do
    assert_difference('Cheer.count', -1) do
      delete :destroy, id: @cheer
    end

    assert_redirected_to cheers_path
  end
end
