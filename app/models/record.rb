class Record < ApplicationRecord
  belongs_to :user
  has_many :workout, dependent: :destroy

  validates :start_time, presence: true, uniqueness: { scope: :user_id }
  validates :title, length: { maximum: 20 }
  validates :description, length: { maximum: 100 }
end
