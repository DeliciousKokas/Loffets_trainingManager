require 'rails_helper'

RSpec.describe 'Users', type: :system do

  let(:user) {FactoryBot.create(:user)}

  # it "can create new user" do
  #   visit root_path
  #   click_on "SignUp"
  #   expect(page).to have_current_path "/users/sign_up"

  #   expect {
  #     fill_in "Email", with: "test@test.com"
  #     fill_in "user_password", with: "Test1234!"
  #     fill_in "user_password_confirmation", with: "Test1234!"
  #     click_button "Sign up"
  #   }.to change(User, :count).by(1)
  # end

  it "can Login to user" do
    visit root_path

    click_on "SignIn"
    expect(page).to have_current_path "/users/sign_in"

    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Log in"
    expect(page).to have_current_path main_path
  end

  it "can Login to user" do
    sign_in user

    expect(page).to have_current_path root_path
  end
end