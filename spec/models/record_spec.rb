require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @record = FactoryBot.build(:record, user_id:@user.id)
  end

  it "is valid with start_time and user_id" do
    expect(@record).to be_valid
  end

  it "is invalid without start_time" do
    @record.start_time = nil
    expect(@record).to_not be_valid
  end

  it "is invalid without user_id" do
    @record.user_id = nil
    expect(@record).to_not be_valid
  end

  it "is valid with same start_time but different user_id" do
    user_1 = User.create(name:"test01", email:"test01@test.com", password:"Test001!")
    user_2 = User.create(name:"test02", email:"test02@test.com", password:"Test002!")
    record_1 = FactoryBot.create(:record, user_id:user_1.id)
    record_2 = FactoryBot.build(:record, user_id:user_2.id)
    expect(record_1).to be_valid
    expect(record_2).to be_valid
  end

  it "is invalid with same start_time and user_id" do
    record_1 = FactoryBot.create(:record, title:"test", user_id:@user.id)
    record_2 = FactoryBot.build(:record, title:"test", user_id:@user.id)
    expect(record_1).to be_valid
    expect(record_2).to_not be_valid
    expect(record_2.errors[:start_time]).to include("has already been taken")
  end

  it "is invalid when title is more than 50 characters" do
    count_50 = "a" * 50
    record_50_title = FactoryBot.build(:record, title: count_50, user_id:@user.id)
    record_51_title = FactoryBot.build(:record, title: count_50+"51", user_id:@user.id)
    expect(record_50_title).to be_valid
    expect(record_51_title).to_not be_valid
  end

  it "is invalid when description is more than 255 description" do
    count_255 = "a" * 255
    record_255_des = FactoryBot.build(:record, description: count_255, user_id:@user.id)
    record_256_des = FactoryBot.build(:record, description: count_255+"256", user_id:@user.id)
    expect(record_255_des).to be_valid
    expect(record_256_des).to_not be_valid
  end

end
