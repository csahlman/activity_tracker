# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string(255)
#  password_digest    :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  remember_password  :boolean          default(FALSE)
#  confirmation_token :string(255)
#  confirmed_at       :datetime
#

class User < ActiveRecord::Base
  has_secure_password

  before_create :create_confirmation_token

  def confirmed?
    confirmed_at.present? 
  end

  private

    def create_confirmation_token
      generate_token(:confirmation_token)
    end

    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end
end
