# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'members/show', type: :view do
  before do
    assign(:member, create(:member))
  end

  it 'renders attributes in <p>' do
    render
  end
end
