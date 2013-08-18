class CreateChatrooms < ActiveRecord::Migration
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :chatrooms, :name, unique: true
  end
end
