# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'Home' do
    it "should have the content 'Index'" do
      visit '/index'
      expect(page).to have_content('example')
    end
  end
end
