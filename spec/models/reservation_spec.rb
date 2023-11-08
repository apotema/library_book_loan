# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it { is_expected.to belong_to(:member) }
  it { is_expected.to have_one(:book) }
end
