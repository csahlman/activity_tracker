# == Schema Information
#
# Table name: company_informations
#
#  id                   :integer          not null, primary key
#  area                 :string(255)
#  type                 :string(255)
#  development_cost     :integer
#  legal_cost           :integer
#  office_space_cost    :integer
#  business_type        :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  developer_quantity   :float            default(1.0)
#  designer_quantity    :float            default(1.0)
#  square_feet          :integer          default(200)
#  legal_hours          :integer          default(15)
#  domain_name_quantity :integer          default(1)
#

require 'spec_helper'

describe CompanyInformation do
  pending "add some examples to (or delete) #{__FILE__}"
end
