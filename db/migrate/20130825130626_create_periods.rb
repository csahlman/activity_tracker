class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.integer :user_id

      t.string :period_type
      t.timestamp :start_time
      t.timestamp :end_time

      t.timestamps
    end
    add_index :periods, :user_id
  end
end
