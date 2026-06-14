class SessoesController < ApplicationController
  # Mostra a tela de login
  def new
  end

  # Recebe os dados do formulário e faz o login
  def create
    # Agora busca o usuário pelo LOGIN digitado
    usuario = Usuario.find_by(login: params[:login])

    # Verifica se achou o usuário e se a senha está certa
    # (Como salvamos 'senha123' direto no banco, vamos comparar direto por enquanto)
    if usuario && usuario.senha_hash == params[:senha]
      
      # Salva o ID do usuário na "memória" do navegador (sessão)
      session[:usuario_id] = usuario.id_usuario

      # Redireciona dependendo do tipo!
      if usuario.tipo == "pescador"
        redirect_to pescados_path, notice: "Bem-vindo de volta, #{usuario.nome}!"
      else
        redirect_to root_path, notice: "Bem-vindo ao Catálogo, #{usuario.nome}!"
      end

    else
      # Se errou a senha ou telefone
      flash.now[:alert] = "Login ou senha inválidos."
      render :new, status: :unprocessable_entity
    end
  end

  # Faz o logout (Sair)
  def destroy
    session[:usuario_id] = nil
    redirect_to login_path, notice: "Você saiu com sucesso."
  end
end