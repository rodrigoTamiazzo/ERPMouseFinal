require 'test_helper'

class ChamadosControllerTest < ActionController::TestCase
  setup do
    @chamado = chamados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chamados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chamado" do
    assert_difference('Chamado.count') do
      post :create, :chamado => { :atendente => @chamado.atendente, :data_abertura => @chamado.data_abertura, :data_fechamento => @chamado.data_fechamento, :descricao => @chamado.descricao, :prioridade => @chamado.prioridade, :status => @chamado.status }
    end

    assert_redirected_to chamado_path(assigns(:chamado))
  end

  test "should show chamado" do
    get :show, :id => @chamado
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @chamado
    assert_response :success
  end

  test "should update chamado" do
    put :update, :id => @chamado, :chamado => { :atendente => @chamado.atendente, :data_abertura => @chamado.data_abertura, :data_fechamento => @chamado.data_fechamento, :descricao => @chamado.descricao, :prioridade => @chamado.prioridade, :status => @chamado.status }
    assert_redirected_to chamado_path(assigns(:chamado))
  end

  test "should destroy chamado" do
    assert_difference('Chamado.count', -1) do
      delete :destroy, :id => @chamado
    end

    assert_redirected_to chamados_path
  end
end
