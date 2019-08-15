require 'rails_helper'

RSpec.describe Api::V1::SongsController, type: :controller do
  before(:all) do
    @album = create(:album)
  end

  let!(:songs) { create_list(:song, 20, album_id: @album.id) }

  describe "GET /albums/:album_id/songs" do
    it "should response with 200" do
      get :index, params: {album_id: @album.id}
      expect(response).to have_http_status(200)
    end
  end
  describe "GET genre/:genre_name/random_song" do
    it "should response with 200" do
      get :random_song, params: {genre_name: 'vallenato'}
      expect(response).to have_http_status(:success)
    end
  end
end