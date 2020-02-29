require 'rails_helper'

RSpec.describe Relationship, type: :model do

  include_context "project setup"

  it "is valid with a name, email, and password" do
    expect(user).to be_valid
  end
end
