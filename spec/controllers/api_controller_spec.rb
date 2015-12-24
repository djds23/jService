require 'rails_helper'

RSpec.describe ApiController, type: :controller do
  describe '#clues' do
  end

  describe '#random' do
  end

  describe '#categories' do
  end

  describe '#single_category' do
    it 'returns the right category for id' do
      category = Category.first
      get :single_category, id: category.id, format: :json
      expect(response).to be_success

      body = JSON.parse(response.body)
      expect(body["id"]).to eq(category.id)
      expect(body["title"]).to eq(category.title)
      expect(body["clues_count"]).to eq(category.clues_count)
    end
  end

  describe '#mark_invalid' do
  end
end

