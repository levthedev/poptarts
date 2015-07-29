require 'rails_helper'

describe PoptartsController do
  context'#index' do
    it 'returns all the poptarts' do
      Poptart.create(flavor: 'strawberry', sprinkles: 'red')

      get :index, format: :json

      expect(response).to have_http_status(:ok)
      poptarts = JSON.parse(response.body)
      expect(poptarts.count).to eq(1)

      poptart = poptarts.first
      expect(poptart['flavor']).to eq('strawberry')
      expect(poptart['sprinkles']).to eq('red')
    end
  end
end
