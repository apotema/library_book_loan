require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it { should belong_to(:member) }
  it { should have_one(:book) }
end
