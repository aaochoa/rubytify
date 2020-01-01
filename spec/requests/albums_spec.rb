require 'rails_helper'

RSpec.describe Api::V1::AlbumsController, type: :controller do
  describe "GET /artists/:artist_id/albums" do
    
    before(:all) do
      @artist = create(:artist)
    end
    
    let!(:albums) { create_list(:album, 9, artist_id: @artist.id) }
    
    it "should response with 200" do
      get :index, params: {artist_id: @artist.id}
      expect(response).to have_http_status(200)
    end
  end
end

=begin
describe 'GET /albums/:id/songs' do
  before(:all) do
    @album = FactoryBot.create(:album, :with_song)
  end
  before {get "/api/v1/albums/#{@album.id}/songs"}
  it 'returns all songs in an album' do
    json = JSON.parse(response.body)
    expect(json['status']).to eql('SUCCESS')
  end
end
=end
