class PagesController < ApplicationController
  def main
    @records = Record.all
  end

  def events
    @record = Record.find_by(start_time: params[:start_time])
    @workouts = @record.workout


    # link_to "+ Service", new_my_service_path(:my_service => { :account_id => acct.id })
    # # my_services_controller.rb
    # def new
    #   @my_service = MyService.new(params[:my_service])
    # end
  end
end 
