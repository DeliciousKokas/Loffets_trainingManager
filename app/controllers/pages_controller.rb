class PagesController < ApplicationController
  # before_action :calculate_vol, only: :create

  def main
    @records = current_user.record.all
    @new_record = current_user.record.new
  end

  def new_record
    @new_record = Record.new(new_record_params)
    @new_record.save
    redirect_to "/main"
  end

  def events
    @record = current_user.record.find_by(start_time: params[:start_time])
    @workouts = @record.workout
    @new_workout = @record.workout.new
  end

  def create
    @new_workout = Workout.new(workout_params)
    @new_workout.vol = @new_workout.set * @new_workout.rep * @new_workout.weight
    @new_workout.save
    redirect_back(fallback_location: "/main")
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    redirect_back(fallback_location: "/main")
  end


  # def calculate_vol
  #   cal = Workout.find(self.params[:workout][:set])
  #   debugger
  #   vol = params[:workout][:set] * params[:workout][:rep] * params[:workout][:weight]
  # end
  
  private

  def workout_params
    params.require(:workout).permit(:record_id, :name, :set, :rep, :weight)
  end

  def new_record_params
    params.require(:record).permit(:user_id, :title, :description, :start_time)
  end
end 
