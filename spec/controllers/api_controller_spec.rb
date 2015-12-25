require 'rails_helper'

RSpec.describe ApiController, type: :controller do
  describe '#clues' do
    let(:recent_clue) { FactoryGirl.create(:clue, airdate: Time.now - 1.week ) }
    let(:cheap_clue)  { FactoryGirl.create(:clue, value: 100 ) }
    let(:new_clue )   { FactoryGirl.create(:clue, airdate: Time.now ) }

    it 'only returns the proper valued clues' do
      get :clues, value: cheap_clue.value, format: :json
      expect(response).to be_success

      body = JSON.parse(response.body)
      expect(body.count).to eq(1)

      clue = body.first
      expect(clue["id"]).to eq(cheap_clue.id)
    end

    it 'only returns clues within the proper airdates' do
      get :clues, min_date: recent_clue.airdate.to_s, max_date: (new_clue.airdate + 1.day).to_s, format: :json
      expect(response).to be_success

      body = JSON.parse(response.body)
      expect(body.count).to eq(2)

      response_ids = body.map { |h| h["id"] }
      expect(response_ids).to include(recent_clue.id)
      expect(response_ids).to include(new_clue.id)
    end

    it 'only returns clues from the proper category' do
      get :clues, value: cheap_clue.value, format: :json
      expect(response).to be_success
      byebug
    end
  end

  describe '#random' do
  end

  describe '#categories' do
  end

  describe '#single_category' do
    let(:category) { FactoryGirl.create(:category) }
    it 'returns the right category for id' do
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

