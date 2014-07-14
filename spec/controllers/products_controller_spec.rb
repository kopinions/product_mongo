require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
  describe 'GET index' do
    context 'given products' do
      before() {
        get :index
      }

      it 'return 200' do
        expect(response).to have_http_status(200)
      end
    end
  end



  describe 'POST' do
    context 'create product' do
      before {
        expect(Product).to receive(:new).with({name: 'apple'}).and_call_original
        post :create, product: {name: 'apple'}
      }

      it 'return 201' do
        expect(response).to have_http_status(201)
      end

      it 'return uri of the create product' do
        expect(response.header["Location"]).to match(%{/products/.*{25}})
      end
    end
  end
end
