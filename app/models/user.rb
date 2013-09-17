# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)
#  password_digest        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  remember_password      :boolean          default(FALSE)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  password_reset_sent_at :datetime
#  password_reset_token   :string(255)
#  username               :string(255)
#

class User < ActiveRecord::Base
  has_secure_password

  before_create :create_confirmation_token

  username_regex = /\A(_|([a-z]_)|[a-z])([a-z0-9]+_?)*\z/i
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: { case_sensitive: false }, 
    format: { with: email_regex }
  validates :username, presence: true, uniqueness: { case_sensitive: false }, 
    format: { with: username_regex }, length: { within: 4..16 }
  
  validates :password, presence: true, length: { within: 8..40 }, if: :setting_password?
  validates :password_confirmation, presence: true, if: :setting_password?


  def confirmed?
    confirmed_at.present? 
  end

  def valid_for_password_reset?
    (password_reset_token.present? && password_reset_sent_at > 15.minutes.ago) ? false : true
  end

  def create_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.now
    save!
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

    def setting_password?
      self.password.present? || self.password_confirmation.present?
    end
end
