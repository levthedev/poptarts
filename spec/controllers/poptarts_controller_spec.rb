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

      expect(poptart_response['flavor']).to eq('smores')
      expect(poptart_response['sprinkles']).to eq('none')
    end
  end
  context '#create' do
    it 'creates a poptart' do
      post :create, format: :json, poptart: { flavor: 'boston creme', sprinkles: 'black and white' }

      expect(response).to have_http_status :created

      poptart_response = JSON.parse(response.body)

      expect(poptart_response['flavor']).to eq('boston creme')
      expect(poptart_response['sprinkles']).to eq('black and white')
    end
  end
end
