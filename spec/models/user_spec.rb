require 'spec_helper'

describe User do
  context 'validation' do
    let(:user) { User.new }

    [:password, :email].each do |attr|
      it "complains when the #{attr} is blank" do
        user.valid?
        expect(user.errors[attr]).to include("can't be blank")
      end
    end

    it 'complains when password confirmation is blank' do
      user.password = 'password'
      user.valid?
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end

    it 'ensures unique email addresses' do
      user1 = create(:user)
      user.email = user1.email
      user.valid?
      expect(user.errors[:email]).to include("has already been taken")
    end
  end
end
