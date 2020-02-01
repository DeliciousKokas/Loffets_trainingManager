class ChartsController < ApplicationController
  def show
    @myworks = current_user.mywork.all
    @mywork = Mywork.find(params[:mywork_id])
    @workouts = Workout.where(mywork_id: @mywork)
    
    @chart = []
    @workouts.each do |workout|
      @chart.push([Record.find(workout.record_id).start_time, workout.weight])
    end

    @chart = @chart.sort

  end
end
