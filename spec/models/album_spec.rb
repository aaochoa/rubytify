require 'rails_helper'

RSpec.describe Album, type: :model do
  describe 'Validations' do
    it 'validate presence of required fields' do
      should validate_presence_of(:name)
      should validate_presence_of(:spotify_url)
    end

    it 'validate relations' do
      should belong_to(:artist)
      should have_many(:songs)
    end
  end
end
