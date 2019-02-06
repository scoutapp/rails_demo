json.extract! user, :id, :name, :email, :created_at, :updated_at
if user.last_drink_history
  json.last_drink_history do
    json.partial! "drink_histories/drink_history", drink_history: user.last_drink_history
    json.beer do
        json.partial! "beers/beer", beer: user.last_drink_history.beer
    end
  end
else
  json.last_drink_history nil
end
json.url user_url(user, format: :json)
