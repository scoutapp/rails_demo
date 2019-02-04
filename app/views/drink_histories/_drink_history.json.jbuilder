json.extract! drink_history, :id, :user_id, :beer_id, :created_at, :updated_at
json.url drink_history_url(drink_history, format: :json)
