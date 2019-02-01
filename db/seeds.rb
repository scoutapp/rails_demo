# We use brewerydb(https://www.brewerydb.com) as a data source.
# We could store all information in our db and sync by webhook,
# But to show api call on Scout, we just store id and get detail info by api call :)
def store_beer_ids
  # NOTE: brewarydb_ids.csv has 1000 beer ids. if you wish to increase the number, use following code to call api and create
  # beers = []
  # (21..40).each do |page|
  #   results = HTTParty.get('https://sandbox-api.brewerydb.com/v2/beers', query: {key: Rails.application.credentials.brewerydb_api_key, p: page})['data']
  #   if results.any?
  #     results.each do |result|
  #       beers << Beer.new(brewarydb_id: result['id'])
  #     end
  #   end
  # end
  beers = []
  CSV.foreach('data/brewarydb_ids.csv', encoding: 'UTF-8', headers: true, skip_blanks: true, force_quotes: true, quote_char: "\"") do |row|
    beers << Beer.new(brewarydb_id: row['brewarydb_id'])
  end
  Beer.import beers
end

10.times do
  u = User.create_fake!
end
store_beer_ids