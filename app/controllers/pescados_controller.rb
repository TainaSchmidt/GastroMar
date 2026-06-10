class PescadosController < ApplicationController
 # Tela principal: Mostra todos os pescados disponíveis
  def index
    @pescados = Pescado.where(disponivel: true)
  end

  # Tela de detalhes: Mostra um pescado específico
  def show
    @pescado = Pescado.find(params[:id])
  end

  # Tela do Formulário: Prepara um pescado novo para ser criado
  def new
    @pescado = Pescado.new
  end

  # Ação invisível: Recebe os dados do formulário e salva no Supabase
  def create
    @pescado = Pescado.new(pescado_params)
    
    # IMPORTANTE: Como ainda não temos login criado, vamos fingir que 
    # o primeiro usuário do banco é o dono desse pescado temporariamente.
    @pescado.id_usuario = Usuario.first&.id_usuario || 1 

    if @pescado.save
      redirect_to pescados_path, notice: "Pescado cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Segurança do Rails para filtrar o que vem do formulário
  def pescado_params
    params.require(:pescado).permit(:nome, :quantidade, :unidade, :preco_por_unidade, :descricao, :data_pesca)
  end
end