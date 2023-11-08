# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_one(:member) }

  describe '#clerk?' do
    let(:clerk) { create(:user, role: 'clerk') }
    let(:non_clerk) { create(:user, role: 'member') }

    context 'when the user is a clerk' do
      it 'returns true' do
        expect(clerk.clerk?).to be true
      end
    end

    context 'when the user is not a clerk' do
      it 'returns false' do
        expect(non_clerk.clerk?).to be false
      end
    end
  end
end
