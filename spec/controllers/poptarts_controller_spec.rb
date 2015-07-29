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

    it 'returns a poptart' do
      poptart = Poptart.create(flavor: 'smores', sprinkles: 'none')
      get :show, id: poptart.id, format: :json

      expect(response).to have_http_status(:ok)
      poptart_response = JSON.parse(response.body)

     # poptart = poptart_response.first

     # expect(poptart['flavor']).to eq('smores')
     # expect(poptart['sprinkles']).to eq('none')
    end
  end
end
