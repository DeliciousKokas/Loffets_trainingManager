class ChartsController < ApplicationController
  def show
    @myworks = current_user.mywork.all

    @count_30days = current_user.count_30days

    @mywork_30days = []
    @myworks.each do |mywork|
      mywork_counter = mywork.workout.count
      @mywork_30days.push([mywork.name, mywork_counter])
    end
    @mywork_30days = @mywork_30days.sort_by { |_k, v| v }.reverse

    @favorit = @mywork_30days.first[0] if @mywork_30days.present?

    if params[:mywork_id]

      @workouts = Workout.where(mywork_id: Mywork.find(params[:mywork_id]))

      @chart = []
      @workouts.each do |workout|
        @chart.push([Record.find(workout.record_id).start_time, workout.vol])
      end

      @chart = @chart.sort
    end
  end
end
