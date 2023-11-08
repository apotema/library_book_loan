# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  it { is_expected.to belong_to(:reservation).optional }
end
