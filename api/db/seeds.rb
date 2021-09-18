if Rails.env == 'development'
  5.times do |n|
    username  = "example-#{n + 1}"
    email = "example-#{n + 1}@example.com"
    password = 'password'
    user = User.create!(
      username: username,
      email: email,
      profile: 'Hi',
      password: password,
      password_confirmation: password
    )
  end
end