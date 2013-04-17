require 'test_helper'

class CelularsControllerTest < ActionController::TestCase
  setup do
    @celular = celulars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:celulars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create celular" do
    assert_difference('Celular.count') do
      post :create, celular: { dataCompra: @celular.dataCompra, estadoUso: @celular.estadoUso, garantia: @celular.garantia, modelo: @celular.modelo, numeroSerial: @celular.numeroSerial }
    end

    assert_redirected_to celular_path(assigns(:celular))
  end

  test "should show celular" do
    get :show, id: @celular
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @celular
    assert_response :success
  end

  test "should update celular" do
    put :update, id: @celular, celular: { dataCompra: @celular.dataCompra, estadoUso: @celular.estadoUso, garantia: @celular.garantia, modelo: @celular.modelo, numeroSerial: @celular.numeroSerial }
    assert_redirected_to celular_path(assigns(:celular))
  end

  test "should destroy celular" do
    assert_difference('Celular.count', -1) do
      delete :destroy, id: @celular
    end

    assert_redirected_to celulars_path
  end
end
