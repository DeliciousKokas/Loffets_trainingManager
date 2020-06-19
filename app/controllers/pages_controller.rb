class PagesController < ApplicationController
  # before_action :calculate_vol, only: :create

  def users
    @users = current_user.search(params[:search]).paginate(page: params[:page], per_page: 30)
  end
  
  def main
    @records = current_user.record.all
    @new_record = current_user.record.new
  end

  def new_record
    @new_record = Record.new(new_record_params)
    @new_record.save
    redirect_to events_path(start_time: @new_record.start_time)
  end

  def events
    @record = current_user.record.find_by(start_time: params[:start_time])
    @myworks = current_user.mywork.all
    @workouts = @record.workout.all
  end

  def create
    @new_workout = Workout.new(workout_params)
    @new_workout.calculate_vol
    @new_workout.save
    redirect_back(fallback_location: "/main")
  end

  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    redirect_back(fallback_location: "/main")
  end

  def myworks
    @myworks = current_user.mywork.all
  end

  def myworks_create
    @new_mywork = Mywork.new(mywork_params)
    @new_mywork.save
    redirect_back(fallback_location: "/main")
  end

  def feed
    @user = current_user
    @records =  current_user.feed.paginate(page: params[:page], per_page: 5)
    @new_record = current_user.record.new
  end


  # def calculate_vol
  #   cal = Workout.find(self.params[:workout][:set])
  #   debugger
  #   vol = params[:workout][:set] * params[:workout][:rep] * params[:workout][:weight]
  # end
  
  private

  def workout_params
    params.require(:workout).permit(:record_id, :mywork_id, :set, :rep, :weight)
  end

  def mywork_params
    params.require(:mywork).permit(:user_id, :name, :description)
  end

  def new_record_params
    params.require(:record).permit(:user_id, :title, :description, :start_time)
  end

end 
