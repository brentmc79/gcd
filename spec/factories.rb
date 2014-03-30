FactoryGirl.define do
  factory :user do
    username "john"
    email "john@email.com"
    password 'password'
    password_confirmation 'password'
  end
end
