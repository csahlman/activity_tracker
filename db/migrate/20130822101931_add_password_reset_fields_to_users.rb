class AddPasswordResetFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_reset_sent_at, :timestamp
    add_column :users, :password_reset_token, :string
  end
end
