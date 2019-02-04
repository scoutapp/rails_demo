json.extract! review, :id, :rate, :comment, :user_id, :beer_id, :created_at, :updated_at
json.url review_url(review, format: :json)
