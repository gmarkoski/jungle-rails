require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save successfully' do
      @user = User.new
      @user.password = "password"
      @user.password_confirmation = "password_confirmation"
     

      expect(@user).to be_present
    end
end
