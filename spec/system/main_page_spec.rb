require 'rails_helper'

RSpec.describe 'Main_page', type: :system do
  include_context 'project setup'

  it 'can create new record from main page' do
    sign_in user
    visit root_path

    click_on user.name
    click_on 'Main'
    expect(page).to have_current_path main_path

    expect do
      fill_in 'record_start_time', with: '2014/01/01'
      fill_in 'record_title', with: 'Test'
      fill_in 'record_description', with: 'Test'
      click_on 'Add'

      expect(page).to have_current_path '/events?start_time=2014-01-01'
    end.to change(user.record, :count).by(1)
  end

  it 'can create new workout' do
    sign_in user
    visit main_path

    mywork

    # click_link 'Details', href: "/events?start_time=#{record.start_time}"
    visit "/events?start_time=#{record.start_time}"
    expect(page).to have_current_path "/events?start_time=#{record.start_time}"

    expect do
      select mywork.name, from: 'workout_mywork_id'
      fill_in 'Set', with: 4
      fill_in 'Rep', with: 10
      fill_in 'Weight', with: 50
      click_on 'Add'

      expect(page).to have_current_path "/events?start_time=#{record.start_time}"
      expect(page).to have_content mywork.workout.first.vol
    end.to change(record.workout, :count).by(1)
  end
end
