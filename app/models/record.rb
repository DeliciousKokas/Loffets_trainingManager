class Record < ApplicationRecord
  belongs_to :user
  has_many :workout, dependent: :destroy

  validates :start_time, presence: true, uniqueness: { scope: :user_id }
  validates :title, length: { maximum: 50 }
  validates :description, length: { maximum: 255 }
end
