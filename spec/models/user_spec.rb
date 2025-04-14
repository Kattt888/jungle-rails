require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'is valid when password and password_confirmation match' do
      user = User.new(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password", password_confirmation: "password")
      expect(user).to be_valid
    end

    it 'is invalid when password and password_confirmation do not match' do
      user = User.new(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password", password_confirmation: "different")
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'is invalid  without a password' do
      user = User.new(first_name: "Jane", last_name: "Doe", email: "jane@example.com", password: nil, password_confirmation: nil)
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

      it 'is invalid without an email' do
        user = User.new(first_name: "Jane", last_name: "Doe", email: nil, password: "password", password_confirmation: "password")
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Email can't be blank")
      end

      it 'is invalid without a first name' do
        user = User.new(first_name: nil, last_name: "Doe", email: "jane@example.com", password: "password", password_confirmation: "password")
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("First name can't be blank")
      end

      it 'is invalid without a last name' do
        user = User.new(first_name: "Jane", last_name: nil, email: "jane@example.com", password: "password", password_confirmation: "password")
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'is invalid if the email is not unique (case insensitive)' do
        User.create!(first_name: "Existing", last_name: "User", email: "Test@Email.com", password: "password", password_confirmation: "password")
        user = User.new(first_name: "New", last_name: "User", email: "test@email.COM", password: "password", password_confirmation: "password")
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Email has already been taken")
      end

      it 'is invalid if password is too short' do
        user = User.new(first_name: "Tiny", last_name: "Pass", email: "tiny@pass.com", password: "12", password_confirmation: "12")
        expect(user).to_not be_valid
        expect(user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
      end
    end

  describe '.authenticate_with_credentials' do
    #add specsss
  end
end
