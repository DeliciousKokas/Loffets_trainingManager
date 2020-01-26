class ChartsController < ApplicationController
  def show
    @records = current_user.record.all
    @chart = [['2018-10-1', 10], ['2018-10-02', 20]]
  end
end
