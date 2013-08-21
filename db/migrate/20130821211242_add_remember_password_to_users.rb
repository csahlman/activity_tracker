class AddRememberPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remember_password, :boolean, default: false
  end
end
