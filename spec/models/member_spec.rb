require 'rails_helper'

RSpec.describe Member, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:reservations) }

  describe 'validations' do
    subject { create :member }
    it { should validate_uniqueness_of(:user_id) }
  end
end
