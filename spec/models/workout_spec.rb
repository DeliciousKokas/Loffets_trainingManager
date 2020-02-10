require 'rails_helper'

RSpec.describe Workout, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @record = FactoryBot.create(:record, user_id:@user.id)
    @mywork = FactoryBot.create(:mywork, user_id:@user.id)
    @workout = FactoryBot.build(:workout, record_id:@record.id, mywork_id:@mywork.id)
    puts @workout.inspect
  end

  it "is valid with set, rep, weight, vol, record_id and mywork_id" do
    expect(@record).to be_valid
  end

  it "is invalid without set" do
    @workout.set = nil
    expect(@workout).to_not be_valid
  end

  it "is invalid without rep" do
    @workout.rep = nil
    expect(@workout).to_not be_valid
  end

  it "is invalid without weight" do
    @workout.weight = nil
    expect(@workout).to_not be_valid
  end

  it "is invalid without vol" do
    @workout.vol = nil
    expect(@workout).to_not be_valid
  end

  it "is invalid without record_id" do
    @workout.record_id = nil
    expect(@workout).to_not be_valid
  end

  it "is invalid without mywork_id" do
    @workout.mywork_id = nil
    expect(@workout).to_not be_valid
  end
end
