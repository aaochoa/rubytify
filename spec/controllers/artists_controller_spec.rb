require 'rails_helper'

RSpec.describe Api::V1::ArtistsController, type: :controller do
  describe 'GET /artists' do
    get('/api/v1/artists')
    json = JSON.parse(response.body)
    expect(json['status']).to eql('SUCCESS')
  end
end
