require 'rails_helper'
RSpec.describe 'Subscriptions', type: :request do
  describe 'POST /api/v1/subscriptions' do
    let(:valid_json) do
      {
        "customer_id": 1,
        "subscriptions": {
          "title": "All Three Subscription",
          "price": 15.99,
          "status": "active",
          "frequency": "one",
          "tea_ids": [1, 2, 3]
        }
      }
    end
    
    context 'when the request is valid' do
      before { post '/api/v1/subscriptions', params: valid_json, as: :json }

      it "creates a new subscription" do
        pretty = JSON.parse(response.body)

        expect(response).to have_http_status(201)
        expect(pretty["data"]["attributes"]["title"]).to eq("All Three Subscription")
        expect(pretty["data"]["attributes"]["price"]).to eq(15.99)
        expect(pretty["data"]["attributes"]["status"]).to eq("active")
        expect(pretty["data"]["attributes"]["frequency"]).to eq("one")
      end
    end
  end
end