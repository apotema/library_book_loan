# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Member, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:reservations) }

  describe 'validations' do
    subject { create :member }

    it { is_expected.to validate_uniqueness_of(:user_id) }
  end
end
