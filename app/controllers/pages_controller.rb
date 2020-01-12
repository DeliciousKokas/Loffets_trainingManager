class PagesController < ApplicationController
  # before_action :calculate_vol, only: :create

  def main
    @records = current_user.record.all  
  end

  def events
    @record = current_user.record.find_by(start_time: params[:start_time])
    @workouts = @record.workout
    @new_workout = @record.workout.new
    # link_to "+ Service", new_my_service_path(:my_service => { :account_id => acct.id })
    # # my_services_controller.rb
    # def new
    #   @my_service = MyService.new(params[:my_service])
    # end
  end

  def create
    @new_workout = Workout.new(record_id:params[:workout][:record_id] ,set: params[:workout][:set], rep: params[:workout][:rep], weight: params[:workout][:weight])
    @new_workout.save
    redirect_to("/")
  end


  # def calculate_vol
  #   cal = Workout.find(self.params[:workout][:set])
  #   debugger
  #   vol = params[:workout][:set] * params[:workout][:rep] * params[:workout][:weight]
  # end
  
end 
