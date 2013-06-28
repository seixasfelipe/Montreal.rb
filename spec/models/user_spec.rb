require 'spec_helper'

describe User do

  before :each do
    @attr = {
      email: "user@example.com",
      password: "changeme",
      password_confirmation: "changeme"
    }
  end

  it "should require an email address" do
    User.new(@attr.merge(email: "")).should_not be_valid
  end

  it "should accept valid email addresses" do
    %w[user@example.com THE_USER@foo.bar.org first.last@foo.jp].each do |address|
      User.new(@attr.merge(email: address)).should be_valid
    end
  end

  it "should reject invalid email addresses" do
    %w[user@foo,com user_at_foo.org example.user@foo.].each do |address|
      User.new(@attr.merge(email: address)).should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    User.create! @attr
    User.new(@attr).should_not be_valid
  end

  describe "password validations" do

    it "should require a password" do
      User.new(@attr.merge(password: "", password_confirmation: "")).should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(password_confirmation: "invalid")).should_not be_valid
    end

    it "should reject short passwords" do
      short = @attr[:password][0..4]
      hash = @attr.merge(password: short, password_confirmation: short)
      User.new(hash).should_not be_valid
    end

  end
end
