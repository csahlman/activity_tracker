# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  location   :string(255)
#  zipcode    :string(255)
#  slug       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class City < ActiveRecord::Base
  extend FriendlyId
  friendly_id :location, use: [ :slugged, :finders ]
end
