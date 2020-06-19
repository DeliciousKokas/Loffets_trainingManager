require 'rails_helper'

RSpec.describe 'Feed_page', type: :system do

  include_context "project setup"

  it "can create new record from feed page" do
    sign_in user
    visit root_path

    click_on user.name
    click_on "Feed"
    expect(page).to have_current_path feed_path

    expect {
      fill_in "record_start_time", with: "2014/01/01"
      fill_in "record_title", with: "Test"
      fill_in "record_description", with: "Test"
      click_on "Add"

      expect(page).to have_current_path "/events?start_time=2014-01-01"
    }.to change(user.record, :count).by(1)
  end

  it "can follow and unfollow" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)

    sign_in user1
    visit feed_path

    expect {
      fill_in "search", with: user2.name
      click_on "Search"
      click_on "Follow"

      expect(page).to have_current_path "/users/list?utf8=✓&search=#{user2.name}"
      expect(page).to have_button "Unfollow"
    }.to change(user1.following, :count).by(1)

    expect {
      visit feed_path
      click_on "following"
      expect(page).to have_current_path "/users/#{user1.id}/following"
      click_on "Unfollow"
    }.to change(user1.following, :count).by(-1)
  end

  it "can desplay follower" do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    sign_in user1

    expect {
      user2.follow(user1)
      visit feed_path
      expect(page).to have_content "1 followers"
      click_on "follower"
      expect(page).to have_current_path "/users/#{user1.id}/followers"
      expect(page).to have_content user2.name
    }.to change(user1.followers, :count).by(1)

    expect {
      user2.unfollow(user1)
      visit feed_path
      expect(page).to have_content "0 followers"
      click_on "follower"
      expect(page).to have_current_path "/users/#{user1.id}/followers"
      expect(page).to have_content "You don't have any"
    }.to change(user1.followers, :count).by(-1)
  end
end