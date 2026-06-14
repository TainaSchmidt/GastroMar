class PescadosController < ApplicationController
  # Esse comando faz o Rails procurar o peixe correto antes de mostrar, editar, atualizar ou deletar
  before_action :set_pescado, only: [:show, :edit, :update, :destroy]

  # 1. READ (Lista todos)
  def index
    @pescados = Pescado.all
  end

  # READ (Mostra os detalhes de um só)
  def show
  end

  # 2. CREATE (Abre a tela de novo cadastro)
  def new
    @pescado = Pescado.new
  end

  # CREATE (Salva no banco de dados)
  def create
    @pescado = Pescado.new(pescado_params)

    if @pescado.save
      redirect_to pescados_path, notice: "Pescado cadastrado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # 3. UPDATE (Abre a tela de edição)
  def edit
    # O @pescado já é carregado automaticamente pelo before_action lá em cima
  end

  # UPDATE (Salva as alterações no banco)
  def update
    if @pescado.update(pescado_params)
      redirect_to pescados_path, notice: "Pescado atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # 4. DELETE (Exclui do banco)
  def destroy
    @pescado.destroy
    redirect_to pescados_path, notice: "Pescado excluído com sucesso!"
  end

  private

  # Método auxiliar para buscar o peixe pelo ID da URL
  def set_pescado
    @pescado = Pescado.find(params[:id])
  end

  # Proteção do Rails: só permite salvar no banco os campos que a gente autorizar aqui
    params.require(:pescado).permit(
      :nome, 
      :quantidade, 
      :unidade, 
      :preco, 
      :descricao, 
      :disponivel
    )
  end
end