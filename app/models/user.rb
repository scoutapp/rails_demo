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

  # For testing
  def self.create_fake!
    User.create!(
      name: Faker::FunnyName.name,
      email: Faker::Internet.free_email,
      language: I18n.available_locales.sample.to_s
    )
  end
end
