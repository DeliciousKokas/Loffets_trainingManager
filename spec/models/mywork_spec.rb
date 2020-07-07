require 'rails_helper'

RSpec.describe Mywork, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @mywork = FactoryBot.build(:mywork, user_id:@user.id)
  end

  it "is valid with name and user_id" do
    expect(@mywork).to be_valid
  end

  it "is invalid without name" do
    @mywork.name = nil
    expect(@mywork).to_not be_valid
  end

  it "is invalid without user_id" do
    @mywork.user_id = nil
    expect(@mywork).to_not be_valid
  end

  it "is valid with same name but different user_id" do
    user_1 = User.create(name:"test01", email:"test01@test.com", password:"Test001!")
    user_2 = User.create(name:"test02", email:"test02@test.com", password:"Test002!")
    mywork_1 = FactoryBot.create(:mywork, name:"test", user_id:user_1.id)
    mywork_2 = FactoryBot.build(:mywork, name:"test", user_id:user_2.id)
    expect(mywork_1).to be_valid
    expect(mywork_2).to be_valid
  end

  it "is invalid with same name and user_id" do
    mywork_1 = FactoryBot.create(:mywork, name:"test", user_id:@user.id)
    mywork_2 = FactoryBot.build(:mywork, name:"test", user_id:@user.id)
    expect(mywork_1).to be_valid
    expect(mywork_2).to_not be_valid
    expect(mywork_2.errors[:name]).to include("has already been taken")
  end

  it "is invalid when name is more than 20 characters" do
    mywork_20_name = FactoryBot.build(:mywork, name: "12345678901234567890", user_id:@user.id)
    mywork_21_name = FactoryBot.build(:mywork, name: "123456789012345678901", user_id:@user.id)
    expect(mywork_20_name).to be_valid
    expect(mywork_21_name).to_not be_valid
  end

  it "is invalid when description is more than 255 description" do
    count_255 = "a" * 255 
    mywork_255_des = FactoryBot.build(:mywork, description: count_255, user_id:@user.id)
    mywork_256_des = FactoryBot.build(:mywork, description: count_256+"256", user_id:@user.id)
    expect(mywork_255_des).to be_valid
    expect(mywork_256_des).to_not be_valid
  end
end
