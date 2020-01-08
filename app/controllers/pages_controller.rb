class PagesController < ApplicationController
  def main
    @event = Record.all
  end
end 
