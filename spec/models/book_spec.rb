require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should belong_to(:reservation).optional }
end
