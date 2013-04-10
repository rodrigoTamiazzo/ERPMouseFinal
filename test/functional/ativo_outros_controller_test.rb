require 'test_helper'

class AtivoOutrosControllerTest < ActionController::TestCase
  setup do
    @ativo_outro = ativo_outros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ativo_outros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ativo_outro" do
    assert_difference('AtivoOutro.count') do
      post :create, ativo_outro: { descricao: @ativo_outro.descricao, garantia: @ativo_outro.garantia, nome: @ativo_outro.nome }
    end

    assert_redirected_to ativo_outro_path(assigns(:ativo_outro))
  end

  test "should show ativo_outro" do
    get :show, id: @ativo_outro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ativo_outro
    assert_response :success
  end

  test "should update ativo_outro" do
    put :update, id: @ativo_outro, ativo_outro: { descricao: @ativo_outro.descricao, garantia: @ativo_outro.garantia, nome: @ativo_outro.nome }
    assert_redirected_to ativo_outro_path(assigns(:ativo_outro))
  end

  test "should destroy ativo_outro" do
    assert_difference('AtivoOutro.count', -1) do
      delete :destroy, id: @ativo_outro
    end

    assert_redirected_to ativo_outros_path
  end
end
