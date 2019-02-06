class Beer < ApplicationRecord
  has_many :drink_histories
  has_many :reviews

  def events
    get('events')
  end

  def ingredients
    get('ingredients')
  end

  def breweries
    get('breweries')
  end

  def average_rate
    reviews.average(:rate).round(2).to_f
  end

  def get(path)
    # use HTTP request only in production env, since we don't want to share 
    if Rails.env == "production" || ENV['BREWARYDB_API_KEY']
      base_brewary_db_url = "https://sandbox-api.brewerydb.com/v2"
      HTTParty.get("#{base_brewary_db_url}/beer/#{self.brewarydb_id}/#{path}",  query: {key: Rails.application.credentials.brewerydb_api_key})['data']
    else
      nil
    end
  end
end
