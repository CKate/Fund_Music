json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :dob, :user_name, :email, :password_digest, :photo, :balance
  json.url user_url(user, format: :json)
end
