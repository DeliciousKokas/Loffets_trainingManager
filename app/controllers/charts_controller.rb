class ChartsController < ApplicationController
  def show
    @records = current_user.record.all
    @name = current_user.mywork.first.name

    @chart = []
    @mywork = Mywork.first.id
    @workouts = Workout.where(mywork_id: @mywork)
    @workouts.each do |workout|
      @chart.push([Record.find(workout.record_id).start_time, workout.weight])
    end
    
    @dates = current_user.record.each{ |i| puts i.workout}
  end
end
