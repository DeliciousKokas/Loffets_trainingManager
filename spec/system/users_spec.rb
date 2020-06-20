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

  it "can login to user" do
    visit root_path

    click_on "SignIn"
    expect(page).to have_current_path "/users/sign_in"

    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Log in"
    expect(page).to have_current_path main_path
  end

  it "can signout" do
    sign_in user
    visit main_path

    click_on user.name
    click_on "SignOut"
    expect(page).to have_current_path root_path
    expect(page).to have_content "SignIn"
  end
  
  it "can't edit without current password" do
    sign_in user
    visit root_path

    click_on user.name
    click_on "Profile"
    expect(page).to have_current_path edit_user_registration_path

    click_on "Update"
    expect(page).to have_content "Current password can't be blank"

  end

end