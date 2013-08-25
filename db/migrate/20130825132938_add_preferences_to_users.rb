class AddPreferencesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :time_zone, :string, default: "EST"
    add_column :users, :start_of_day, :integer, default: 4
    add_column :users, :period_preference, :string, default: "Day"
  end
end
