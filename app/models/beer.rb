class Beer < ApplicationRecord
  has_many :drink_histories

  def events
    get('events')
  end

  def ingredients
    get('ingredients')
  end

  def breweries
    get('breweries')
  end

  def get(path)
    base_brewary_db_url = "https://sandbox-api.brewerydb.com/v2"
    HTTParty.get("#{base_brewary_db_url}/beer/#{self.brewarydb_id}/#{path}",  query: {key: Rails.application.credentials.brewerydb_api_key})['data']
  end
end
