namespace :performance_test do
  # Since heroku schedular supports only every 10min, schedule job to send request every minute
  desc "queue performance_test_job for next 10min"
  task load: :environment do
    (1..10).each do |x|
      PerformanceTestJob.set(wait_until: x.minutes.from_now).perform_later(3)
    end
  end
end
