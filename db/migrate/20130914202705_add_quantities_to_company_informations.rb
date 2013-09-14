class AddQuantitiesToCompanyInformations < ActiveRecord::Migration
  def change
    add_column :company_informations, :developer_quantity, :float, default: 1.0
    add_column :company_informations, :designer_quantity, :float, default: 1.0
  end
end
