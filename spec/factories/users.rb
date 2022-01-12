# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "#{SecureRandom.uuid}@email.com" }
    password { 12341234 }
  end
end
