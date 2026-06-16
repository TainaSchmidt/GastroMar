class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  stale_when_importmap_changes
  
  # Disponibiliza current_usuario para todos os controllers E para as views
  helper_method :current_usuario

  # Exige login em todas as páginas
  before_action :verificar_login

  private

  def current_usuario
    # Busca o usuário no banco usando o ID salvo na sessão
    @current_usuario ||= Usuario.find_by(id_usuario: session[:usuario_id])
  end

  def verificar_login
    # Libera a página de login, senão fica em loop infinito
    return if controller_name == "sessoes"

    unless current_usuario
      redirect_to login_path, alert: "Faça login para continuar."
    end
  end
end