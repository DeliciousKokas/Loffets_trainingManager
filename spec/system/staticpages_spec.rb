require 'rails_helper'

RSpec.describe 'staticpages', type: :system do
  it 'have right to access guest pages' do
    visit root_path
    visit new_user_session_path
    visit new_user_password_path
    visit new_user_registration_path
  end

  # it "doesn't have right to user pages" do
  #   visit main_path
  #   visit events_path
  #   visit chart_path
  #   visit edit_user_password_path
  #   visit edit_user_registration_path
  # end
end
