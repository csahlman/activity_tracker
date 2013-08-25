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
#  time_zone              :string(255)      default("EST")
#  start_of_day           :integer          default(4)
#  period_preference      :string(255)      default("Day")
#

class User < ActiveRecord::Base
  has_secure_password

  has_many :periods, dependent: :destroy

  before_create :create_confirmation_token

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
end
