require 'rails_helper'

RSpec.describe Api::V1::ArtistsController, type: :controller do
  describe 'GET /artists' do
    let!(:artists) { create_list(:artist, 10) }

    it 'should response with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end

=begin
describe 'GET /api/v1/artists' do
  before(:all) do
    artist = create(:artist)
  end
  before {get '/api/v1/artists'}
  it 'returns all artists' do
    json = JSON.parse(response.body)
    expect(json['status']).to eql('SUCCESS')
  end
end

describe 'Get /artist/:id/albums' do
  before(:all) do
    @artist = FactoryBot.create(:artist, :with_album)
  end
  before {get "/api/v1/artists/#{@artist.id}/albums"}
  it 'returns all albums by an artist' do
    json = JSON.parse(response.body)
    expect(json['status']).to eql('SUCCESS')
  end
end
=end