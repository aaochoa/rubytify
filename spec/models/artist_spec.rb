require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'Validations' do
    it 'validate presence of required fields' do
      should validate_presence_of(:name)
      should validate_presence_of(:spotify_url)
    end

    it 'validate relations' do
      should have_many(:albums)
    end
  end
end