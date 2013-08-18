# == Schema Information
#
# Table name: chatrooms
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Chatroom < ActiveRecord::Base
end
