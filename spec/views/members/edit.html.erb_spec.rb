# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'members/edit', type: :view do
  let(:member) do
    create(:member)
  end

  before do
    assign(:member, member)
  end

  it 'renders the edit member form' do
    render

    assert_select 'form[action=?][method=?]', member_path(member), 'post' do
    end
  end
end
