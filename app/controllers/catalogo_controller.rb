class CatalogoController < ApplicationController
  # Tela principal do restaurante: mostra as ofertas do dia
  def index
    @pescados = Pescado.where(disponivel: true)
  end

  # Tela de detalhes: o restaurante clica para ver mais sobre um peixe específico
  def show
    @pescado = Pescado.find(params[:id])
  end
end