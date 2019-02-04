# We use brewerydb(https://www.brewerydb.com) as a data source.
# We could store all information in our db and sync by webhook,
# But to show api call on Scout, we just store id and get detail info by api call :)
def store_beer_ids
  p 'Start importing beer'
  # NOTE: beers.csv has 1000 beers data. if you wish to increase the number, use following code to call api and create
  beers = []
  # (1..20).each do |page|
  #   results = HTTParty.get('https://sandbox-api.brewerydb.com/v2/beers', query: {key: Rails.application.credentials.brewerydb_api_key, p: page})['data']
  #   if results.any?
  #     results.each do |result|
  #       beers << Beer.new(brewarydb_id: result['id'],
  #         name: result['name'],
  #         description: result['description'],
  #         abv: result['abv'],
  #         is_retired: result['isRetired'] == 'N' ? false : true,
  #         is_organic: result['isOrganic'] == 'N' ? false : true,
  #         image_path_small: "#{result['labels']['contentAwareIcon'] rescue nil}",
  #         image_path_medium: "#{result['labels']['contentAwareMedium'] rescue nil}",
  #         image_path_large: "#{result['labels']['contentAwareLarge'] rescue nil}",
  #         created_at: result['createDate'],
  #         updated_at: result['updateDate'],
  #         )
  #     end
  #   end
  # end
  # NOTE: When you just use csv file to import data... 
  CSV.foreach('data/beers.csv', encoding: 'UTF-8', headers: true, skip_blanks: true, force_quotes: true, quote_char: "\"") do |row|
    beers << Beer.new(brewarydb_id: row['brewarydb_id'],
      name: row['name'],
      description: row['description'],
      abv: row['abv'],
      is_retired: row['is_retired'],
      is_organic: row['is_organic'],
      image_path_small: row['image_path_small'],
      image_path_medium: row['image_path_medium'],
      image_path_large: row['image_path_large'],
      created_at: row['created_at'],
      updated_at: row['updated_at'],
    )
  end
  Beer.import beers
  p 'Completed importing beer'
end

def create_fake_users
  p 'Start creating users'
  users = []
  1000.times do |i|
    users << User.new(
      name: Faker::FunnyName.name,
      email: "#{Faker::Name.first_name}+#{i}@example.com",
      created_at: Faker::Date.between(3.years.ago, Date.today)
    )
  end
  User.import users
  p 'Completed creating users'
end

def create_fake_drink_histories
  p 'Start creating drink history'
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
  p 'Completed creating drink history'
end

def create_fake_reviews
  p 'Start creating reviews'
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
  p 'Completed creating reviews'
end

def create_fake_relationships
  p 'Start creating relationships'
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
  p 'Completed creating relationships'
end


############### Execution
store_beer_ids
create_fake_users
create_fake_drink_histories
create_fake_reviews
create_fake_relationships