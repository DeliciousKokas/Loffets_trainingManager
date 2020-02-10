require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it "is valid with a name, email, and password" do
    expect(@user).to be_valid
  end

  it "is invalid without a name" do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it "is invalid when name is lesser than 4 characters" do
    user_4_name = FactoryBot.build(:user, name: "1234")
    user_3_name = FactoryBot.build(:user, name: "123")
    expect(user_4_name).to be_valid
    expect(user_3_name).to_not be_valid
  end

  it "is invalid when name is more than 12 characters" do
    user_12_name = FactoryBot.build(:user, name: "123456789012")
    user_13_name = FactoryBot.build(:user, name: "1234567890123")
    expect(user_12_name).to be_valid
    expect(user_13_name).to_not be_valid
  end

  it "is invalid with a duplicate name" do
    @user.save
    user2 = User.new(name:@user.name, password:"test23452345!", email:"test2345@test.com")
    user2.valid?
    expect(user2.errors[:name]).to include("has already been taken")
  end

  it "is invalid without email" do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it "is invalid without currect eamil format" do
    user_no_at = FactoryBot.build(:user, email: "testtest.com")
    user_no_dom = FactoryBot.build(:user, email: "test@")
    expect(user_no_at).to_not be_valid
    expect(user_no_dom).to_not be_valid
  end

  it "is invalid with duplicate email" do
    user_1 = FactoryBot.create(:user)
    user_2 = User.new(name:"test2", password:"test23452345!", email:user_1.email)
    expect(user_1).to be_valid
    user_2.valid?
    expect(user_2.errors[:email]).to include("has already been taken")
  end

  it "is invalid without password" do
    @user.password = nil
    expect(@user).to_not be_valid
  end

  it "is invalid when password is lesser than 8 characters" do
    user_8_pass = FactoryBot.build(:user, password: "!test678")
    user_7_pass = FactoryBot.build(:user, password: "!test67")
    expect(user_8_pass).to be_valid
    expect(user_7_pass).to_not be_valid
  end

  it "is invalid when password is more than 16 characters" do
    user_16_pass = FactoryBot.build(:user, password: "!test67890123456")
    user_17_pass = FactoryBot.build(:user, password: "!test678901234567")
    expect(user_16_pass).to be_valid
    expect(user_17_pass).to_not be_valid
  end

  it "is invalid when password don't have enough complexity" do
    user_no_num = FactoryBot.build(:user, password: "testtest!")
    user_no_str = FactoryBot.build(:user, password: "12341234!")
    user_no_sym = FactoryBot.build(:user, password: "test1234")
    expect(user_no_num).to_not be_valid
    expect(user_no_str).to_not be_valid
    expect(user_no_sym).to_not be_valid
  end

end
