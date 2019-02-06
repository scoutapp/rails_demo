module PerformanceTest
  # send requests, so that we can see the data on Scout
  def self.load(limit)
    models = [User, Review, DrinkHistory, Beer]
    host = ( Rails.stage == 'development' ) ? "http://localhost:5000" : "https://#{ENV['DOMAIN_NAME']}"

    models.each do |model|
      route_key = User.model_name.route_key

      # add empty string to request index page too
      model.all.pluck(:id).sample(limit).push('').each do |id|
        url = "#{host}/#{route_key}/#{id}"
        p url
        HTTParty.get(url)
        sleep(2)
      end
    end
  end

  # Run benchmark test.
  # This could be rspec file, but to keep everything under this file, I'm putting here.
  # I'm only comparing json string output speed since we can't use jbuilder to create serializable hash
  # Result on my(Hiro) local: https://cl.ly/2b1202016284
  #                       user       system     total       real
  # fast_jsonapi(1000):   0.065895   0.000903   0.066798 (  0.069450)
  # ams(1000):            0.311044   0.002982   0.314026 (  0.318097)
  # jbuilder(1000):       0.079265   0.001000   0.080265 (  0.082538)
  def self.run
    # When log is noisy, please uncomment following
    ActiveSupport::Notifications.unsubscribe(ActiveModelSerializers::Logging::RENDER_EVENT)
    ActiveRecord::Base.logger = nil

    [1,25,100,250,1000].each do |limit|
      set_users(limit)
      # Use bmbm to avoid results depend on the order in which items are run
      results = Benchmark.bmbm do |x|
        x.report("fast_jsonapi(#{limit}):")   { fast_jsonapi }
        x.report("ams(#{limit}):") { ams }
        x.report("jbuilder(#{limit}):")  { jbuilder }
      end
    end
  end

  private
  def self.ams
    # Sample
    # ActiveModelSerializers::SerializableResource.new(
    #   @users,
    #   each_serializer: UserAmsSerializer
    # ).serializable_hash.to_json
  end
  def self.fast_jsonapi
    # Sample
    # UserSerializer.new(@users).serialized_json
  end
  def self.jbuilder
    # NOTE: this is sample from _user.json.jbuilder
    Jbuilder.encode do |json|
      json.array! @users do |user|
        json.extract! user, :id, :name, :email, :created_at, :updated_at
        if user.last_drink_history
          json.last_drink_history do
            json.extract! user.last_drink_history, :id, :user_id, :beer_id, :created_at, :updated_at
            json.beer do
              json.extract! user.last_drink_history.beer, :id, :brewarydb_id, :name, :description, :is_retired, :is_organic, :average_rate,
                :image_path_small, :image_path_medium, :image_path_large, :created_at, :updated_at
            end
          end
        else
          json.last_drink_history nil
        end
      end
    end
  end

  def self.set_users(limit)
    @users = User.where(id: User.all.pluck(:id).sample(100))
  end
end
