json.extract! beer, :id, :brewarydb_id, :name, :description, :is_retired, :is_organic, :average_rate,
  :image_path_small, :image_path_medium, :image_path_large, :created_at, :updated_at
json.url beer_url(beer, format: :json)
