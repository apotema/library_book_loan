# frozen_string_literal: true

FactoryBot.define do
  factory :reservation do
    book
    member
  end
end
