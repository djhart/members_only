class User < ApplicationRecord
  require 'digest/sha1'
  attr_accessor :remember_token
  before_validation :remember, on: :create
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
  # class << self
  #   def User.new_token
  #     SecureRandom.urlsafe_base64
  #   end
    
  #   def digest(string)
  #     Digest::SHA1.hexdigest string
  #   end
  # end
      
  
  def remember
    self.remember_token = SecureRandom.urlsafe_base64
    update_attribute(:remember_digest, Digest::SHA1.hexdigest(remember_token))
  end
end

