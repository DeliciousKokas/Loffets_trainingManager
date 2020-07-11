class Mywork < ApplicationRecord
  belongs_to :user
  has_many :workout, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { scope: :user_id }
  validates :description, length: { maximum: 255 }
end

