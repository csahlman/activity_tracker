class CreateCompanyInformations < ActiveRecord::Migration
  def change
    create_table :company_informations do |t|
      t.string :area
      t.string :type
      t.integer :development_cost
      t.integer :legal_cost
      t.integer :office_space_cost
      t.string :business_type

      t.timestamps
    end
  end
end
