class AddMoreStuffToCompanyInformations < ActiveRecord::Migration
  def change
    add_column :company_informations, :square_feet, :integer, default: 200
    add_column :company_informations, :legal_hours, :integer, default: 15
    add_column :company_informations, :domain_name_quantity, :integer, default: 1
  end
end
