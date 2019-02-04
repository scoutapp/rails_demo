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
    beers << Beer.new(brewarydb_id: row['brewarydb_id'],
      created_at: Faker::Date.between(3.years.ago, Date.today)
    )
  end
  Beer.import beers
end

def create_fake_users
  users = []
  1000.times do
    users << User.User.new(
      name: Faker::FunnyName.unique.name,
      email: Faker::Internet.unique.free_email,
      created_at: Faker::Date.between(3.years.ago, Date.today)
    )
  end
  User.import users
end

def create_fake_drink_histories
  100.times do
    drink_histories = []
    1000.times do
      drink_histories << DrinkHistory.new(user: User.find(User.pluck(:id).sample),
        beer: Beer.find(Beer.pluck(:id).sample),
        amount: Faker::Number.between(1, 10),
        created_at: Faker::Date.between(3.years.ago, Date.today))
    end
    DrinkHistory.import drink_histories
  end
end

def create_fake_reviews
  500.times do
    reviews = []
    100.times do
      reviews << Review.new(user: User.find(User.pluck(:id).sample),
        beer: Beer.find(Beer.pluck(:id).sample),
        rate: Faker::Number.between(1, 5),
        comment: Faker::BojackHorseman.quote,
        created_at: Faker::Date.between(3.years.ago, Date.today))
    end
    Review.import reviews
  end
end

def create_fake_relationships
  existing_relations = []
  500.times do
    relationships = []
    100.times do
      # Without shuffle, earlier id users won't have any followers...
      user_ids = User.where(id: User.pluck(:id).sample(2)).pluck(:id).shuffle
      if !existing_relations.include? user_ids
        existing_relations << user_ids
        relationships << Relationship.new(follower_id: user_ids.first,
          following_id: user_ids.last,
          created_at: Faker::Date.between(3.years.ago, Date.today))
      end
    end
    Relationship.import relationships
  end
end

# store_beer_ids
# create_fake_users
# create_fake_drink_histories
# create_fake_reviews
create_fake_relationships