require 'faker'
require_relative '../validators/email_validator'

class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, email: true

  before_save :generate_application_code

  def generate_application_code
    code = nil
    loop do
      code = Faker::Alphanumeric.alphanumeric number: 10, min_alpha: 3, min_numeric: 3
      code_in_use = User.exists?(application_code: code)
      break unless code_in_use
    end

    self.application_code = code
  end
end
