class User < ApplicationRecord
  has_many :record, dependent: :destroy
  has_many :mywork, dependent: :destroy
  
  mount_uploader :image, ImageUploader

  validates :name, presence: true, uniqueness: true, length: { in: 4..12 }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)(?=.*?[\W_])[!-~]+\z/i
  validates :password, presence: true, length: { in: 8..16 }, format: { with: VALID_PASSWORD_REGEX }
  validates :description, length: { maximum: 200 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end
