require 'rails_helper'

    RSpec.describe Api::V1::ArtistsController, type: :controller do
      describe 'GET /api/v1/artists' do
        before(:all) do
          @artist = create(:artist)
        end
        it 'returns a list of artists' do
          get('/api/v1/artists')
          json = JSON.parse(response.body)
          expect(json['status']).to eql('SUCCESS')
          #expect(json['status']).to eql('ok')
        end
      end
    end
