require 'test_helper'

class LicencaDeSoftwaresControllerTest < ActionController::TestCase
  setup do
    @licenca_de_software = licenca_de_softwares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:licenca_de_softwares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create licenca_de_software" do
    assert_difference('LicencaDeSoftware.count') do
      post :create, licenca_de_software: { data_de_expiracao: @licenca_de_software.data_de_expiracao, numero_da_licenca: @licenca_de_software.numero_da_licenca, produto: @licenca_de_software.produto, quantidade: @licenca_de_software.quantidade, valor_de_compra: @licenca_de_software.valor_de_compra }
    end

    assert_redirected_to licenca_de_software_path(assigns(:licenca_de_software))
  end

  test "should show licenca_de_software" do
    get :show, id: @licenca_de_software
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @licenca_de_software
    assert_response :success
  end

  test "should update licenca_de_software" do
    put :update, id: @licenca_de_software, licenca_de_software: { data_de_expiracao: @licenca_de_software.data_de_expiracao, numero_da_licenca: @licenca_de_software.numero_da_licenca, produto: @licenca_de_software.produto, quantidade: @licenca_de_software.quantidade, valor_de_compra: @licenca_de_software.valor_de_compra }
    assert_redirected_to licenca_de_software_path(assigns(:licenca_de_software))
  end

  test "should destroy licenca_de_software" do
    assert_difference('LicencaDeSoftware.count', -1) do
      delete :destroy, id: @licenca_de_software
    end

    assert_redirected_to licenca_de_softwares_path
  end
end
