require 'rails_helper'

RSpec.describe 'chart_page', type: :system do

  include_context "project setup"

  it "can create new record from feed page" do
    sign_in user
    visit chart_path
    expect(page).to have_current_path chart_path
    
  end
end