# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'members/new', type: :view do
  before do
    assign(:member, Member.new)
  end

  it 'renders new member form' do
    render

    assert_select 'form[action=?][method=?]', members_path, 'post' do
    end
  end
end
