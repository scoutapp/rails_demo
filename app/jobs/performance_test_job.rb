require 'performance_test'
class PerformanceTestJob < ApplicationJob
  queue_as :default

  def perform(limit)
    PerformanceTest.load(limit)
  end
end
