# frozen_string_literal: true

# == Schema Information
#
# Table name: coders
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  token      :string(255)
#  verified   :boolean          default(FALSE)
#  email_hash :string(255)
#

class Coder < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email_hash

  before_create :generate_token
  before_validation :encrypt_email

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.hex(16)
      break random_token unless Coder.exists?(token: random_token)
    end
  end

  def encrypt_email
    self.email_hash = Digest::SHA1.hexdigest(email.to_s) unless email == 'obfuscated'
  end
end
