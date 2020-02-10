class Workout < ApplicationRecord
  belongs_to :mywork
  belongs_to :record

  validates :set, presence: true
  validates :rep, presence: true
  validates :weight, presence: true
  validates :vol, presence: true
end
