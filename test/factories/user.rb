FactoryGirl.define do

  sequence :email do |n|
    "foo#{n}@example.com"
  end

  factory :user do
    username "Pepito"
    email 
    lang 'es'
    password '123456789'
    role 0
    woeid 766273
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    username "Admin"
    email 'admin@gmail.com'
    lang 'es'
    password '12435968770'
    role 1
  end
end
