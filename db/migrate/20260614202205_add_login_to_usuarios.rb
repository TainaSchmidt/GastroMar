class AddLoginToUsuarios < ActiveRecord::Migration[8.1]
  def change
    add_column :usuario, :login, :string
  end
end