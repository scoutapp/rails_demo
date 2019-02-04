# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  email      :string
#  language   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_many :drink_histories

  # For testing
  def self.new_fake!
    User.new(
      name: Faker::FunnyName.unique.name,
      email: Faker::Internet.unique.free_email,
      language: I18n.available_locales.sample.to_s
    )
  end
end
