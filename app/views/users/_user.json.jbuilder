json.extract! user, :id, :name, :email, :created_at, :updated_at
json.last_drink_history do
  json.partial! "drink_histories/drink_history", drink_history: user.last_drink_history
end
json.url user_url(user, format: :json)
