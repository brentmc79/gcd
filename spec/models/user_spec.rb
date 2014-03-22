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
  end
end
