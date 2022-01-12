# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    content { 'Lorem Ipsum' }
    association :user
    association :room
  end
end
