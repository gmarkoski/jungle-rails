require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'is valid with full attributes' do
      @user = User.new(first_name: "Bob", last_name: "Dole", email: "test@test.com", password: "password", password_confirmation: "password")
      expect(@user).to be_valid
    end

    it 'is not valid without a first name' do
      @user = User.new(first_name: nil, last_name: "Dole", email: "test@test.com", password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it 'is not valid without a last name' do
      @user = User.new(first_name: "Bob", last_name: nil, email: "test@test.com", password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it 'is not valid without an email' do
      @user = User.new(first_name: "Bob", last_name: "Dole", email: nil, password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it 'must have a unique email' do
      @user = User.new(first_name: "Bob", last_name: "Dole", email: "TEST@TEST.com", password: "password", password_confirmation: "password")
      @user.save
    end
  
    it 'is not valid without a password' do
      @user = User.new(first_name: "Bob", last_name: "Dole", email: "test@test.com", password: nil, password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it 'is not valid when password and password confirmation don\'t match' do
      @user = User.new(first_name: "Bob", last_name: "Dole", password: "password", password_confirmation: "confirmation")
      expect(@user).to_not be_valid
    end

    it 'is not valid with a password less than three characters' do
      @user = User.new(first_name: "Bob", last_name: "Dole", email: "test@test.com", password: "pw", password_confirmation: "pw")
      expect(@user).to_not be_valid
    end
  end

  describe 'authenticate_with_credentials' do

    it 'should authenticate a user when provided an email and a password' do
      @user = User.new(first_name: "Bob", last_name: "Dole", email: "test@test.com", password: "password", password_confirmation: "password")
      @user.save()

      expect(User.authenticate_with_credentials("test@test.com", "password")).to be_a User
    end

    it 'should not authenticate a user with an incorrect email' do
      @user = User.new(first_name: "Bob", last_name: "Dole", email: "test@test.com", password: "password", password_confirmation: "password")
      @user.save()

      expect(User.authenticate_with_credentials("example@test.com", "password")).to eql(nil)
    end

    it 'should not authenticate a user with an incorrect password' do
      @user = User.new(first_name: "Bob", last_name: "Dole", email: "test@test.com", password: "password1", password_confirmation: "password1")
      @user.save()

      expect(User.authenticate_with_credentials("test@test.com", "example")).to eql(nil)
    end

    
    it 'should authenticate a user even with incorrect case' do
      @user = User.new(first_name: "Bob", last_name: "Dole", email: "test@test.com", password: "password", password_confirmation: "password")
      @user.save()

      expect(User.authenticate_with_credentials("Test@Test.Com", "password")).to be_a User
    end
  
  end
end
