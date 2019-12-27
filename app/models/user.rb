class User < ApplicationRecord
  validates :name,  presence: true, length: { minimum: 4, maximum: 16 }

  validates :email, presence: true, length: { maximum: 255 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i},
    uniqueness: { case_sensitive: false }
  before_save { self.email = email.downcase }
  
  validates :password, presence: true, length: { minimum: 8 }
  has_secure_password

end
