require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do

  describe 'POST' do
    context 'with exist user' do
      let!(:kayla) { User.create(name: "kayla")}
      before do
        expect(User).to receive(:find).with(kayla.id).and_return(kayla)
      end

      context 'with apple product' do
        let!(:apple) { Product.create(name: "apple")}

        context 'create order' do
          before {
            expect_any_instance_of(Order).to receive(:save).and_call_original
            post :create, user_id: kayla.id, order: {name: "sofia", order_items: [product_id: apple.id, quantity: 2]}
          }

          it 'return 201' do
            expect(response).to have_http_status(201)
          end

          it 'return uri of the created order' do
            expect(response.header["Location"]).to match(%r{/users/#{kayla.id}/orders/.*{25}})
          end
        end
      end
    end
  end
end
