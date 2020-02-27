require 'rails_helper'

RSpec.describe 'Users', type: :system do

  include_context "project setup"

  it "can create new user" do
    visit root_path
    click_on "SignUp"
    expect(page).to have_current_path "/users/sign_up"

    expect {
      fill_in "user_email", with: "test@test.com"
      fill_in "user_name", with: "test1234"
      fill_in "user_password", with: "Test1234!"
      fill_in "user_password_confirmation", with: "Test1234!"
      click_button "Sign up"
    }.to change(User, :count).by(1)
  end

  it "can Login to user" do
    visit root_path

    click_on "SignIn"
    expect(page).to have_current_path "/users/sign_in"

    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Log in"
    expect(page).to have_current_path main_path
  end

  it "can Login to user with sign_in helper" do
    sign_in user
    visit root_path

    click_on user.name
    click_on "Main"
    expect(page).to have_current_path main_path

    expect {
      fill_in "record_start_time", with: "2014/01/01"
      fill_in "record_title", with: "Test"
      fill_in "record_description", with: "Test"
      click_on "Add"

      expect(page).to have_current_path "/events?start_time=2014-01-01"
    }.to change(user.record, :count).by(1)
    
  end

  it "can Login to user with sign_in helper" do
    sign_in user
    visit root_path

    click_on user.name
    click_on "Feed"
    expect(page).to have_current_path feed_path

    click_on user.name
    click_on "Chart"
    expect(page).to have_current_path chart_path

    click_on user.name
    click_on "Profile"
    expect(page).to have_current_path edit_user_registration_path
  end
end