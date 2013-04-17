require 'test_helper'

class MaterialProvasControllerTest < ActionController::TestCase
  setup do
    @material_prova = material_provas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:material_provas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create material_prova" do
    assert_difference('MaterialProva.count') do
      post :create, material_prova: { custo: @material_prova.custo, data: @material_prova.data, descricao: @material_prova.descricao, quantidade: @material_prova.quantidade, tipo: @material_prova.tipo }
    end

    assert_redirected_to material_prova_path(assigns(:material_prova))
  end

  test "should show material_prova" do
    get :show, id: @material_prova
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @material_prova
    assert_response :success
  end

  test "should update material_prova" do
    put :update, id: @material_prova, material_prova: { custo: @material_prova.custo, data: @material_prova.data, descricao: @material_prova.descricao, quantidade: @material_prova.quantidade, tipo: @material_prova.tipo }
    assert_redirected_to material_prova_path(assigns(:material_prova))
  end

  test "should destroy material_prova" do
    assert_difference('MaterialProva.count', -1) do
      delete :destroy, id: @material_prova
    end

    assert_redirected_to material_provas_path
  end
end
