require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  it "is valid with a name, email, password" do
    expect(@user).to be_valid
  end

  it "is invalid without a name" do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it "is invalid with more than 16 characters" do
    @user.name = "a" * 17
    expect(@user).to_not be_valid
  end

  it "is invalid with less than 4 characters" do
    @user.name = "a" * 3
    expect(@user).to_not be_valid
  end
  
  it "is invalid without a email" do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it "is invalid with more than 255 characters" do
    @user.email = "a" * 246 + "@emil.test"
    expect(@user).to_not be_valid
  end

  it "is invalid without worng format" do
    @user.email = "a" * 10
    expect(@user).to_not be_valid
  end
  
  it "is invalid without a password" do
    @user.password = nil
    expect(@user).to_not be_valid
  end

end
