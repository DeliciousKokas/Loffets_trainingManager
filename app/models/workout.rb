class Workout < ApplicationRecord
  belongs_to :record
  before_save :calculate_vol

  # def calculate_vol
  #   cal = Workout.find(self.id)
  #   cal.vol = cal.set * cal.rep * cal.weight
  # end
  
end
