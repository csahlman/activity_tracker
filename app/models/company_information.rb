# == Schema Information
#
# Table name: company_informations
#
#  id                :integer          not null, primary key
#  area              :string(255)
#  type              :string(255)
#  development_cost  :integer
#  legal_cost        :integer
#  office_space_cost :integer
#  business_type     :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class CompanyInformation < ActiveRecord::Base

  

end
