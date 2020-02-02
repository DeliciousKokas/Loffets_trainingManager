class Record < ApplicationRecord
  belongs_to :user
  has_many :workout, dependent: :destroy
end
