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
        post :create
      }

      it 'return 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
