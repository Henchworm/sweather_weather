require 'rails_helper'
RSpec.describe User, type: :model do

  describe 'validations' do

    describe '#email' do
      it { should validate_presence_of(:email) }
      it { should_not allow_value(nil).for(:email) }
      it { should validate_uniqueness_of(:email) }
    end

    describe '#password' do
      it { should validate_presence_of(:password_digest)}

      it 'tests a new user creation' do
        user = User.create!(email: "chris@gmail.com", password: "password123")
        expect(user).to_not have_attribute(:password)
        expect(user.password_digest).to_not eq('password123')
      end
      it { should have_secure_password }
    end
  end
end