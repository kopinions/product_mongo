require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do

  describe 'POST' do
    context 'create order' do
      before {
        post :create, user_id: 1
      }

      it 'return 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
