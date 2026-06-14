class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  stale_when_importmap_changes

  # Permite que o HTML (views) use esse método para checar se tem alguém logado
  helper_method :current_usuario

  # Changes to the importmap will invalidate the etag for HTML responses
  def current_usuario
    # Se existe alguém na sessão, procura no banco e guarda na variável
    if session[:usuario_id]
      @current_usuario ||= Usuario.find_by(id_usuario: session[:usuario_id])
    end
  end
end
