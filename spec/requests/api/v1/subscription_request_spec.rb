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

    let(:invalid_json) do
      {
        "customer_id": 1,
        "subscriptions": {
          "title": "All Three Subscription",
          "status": "active",
          "frequency": "one",
          "tea_ids": [1, 2, 3]
        }
      }
    end
    
    context 'when the request is valid' do
      describe 'POST /api/v1/customers/:customer_id/subscriptions' do
        before do
          Rails.application.load_seed
        end
        before { post '/api/v1/customers/1/subscriptions', params: valid_json, as: :json }
  
        it "creates a new subscription" do
          pretty = JSON.parse(response.body)
  
          expect(response).to have_http_status(201)
          expect(pretty["data"]["attributes"]["title"]).to eq("All Three Subscription")
          expect(pretty["data"]["attributes"]["price"]).to eq(15.99)
          expect(pretty["data"]["attributes"]["status"]).to eq("active")
          expect(pretty["data"]["attributes"]["frequency"]).to eq("one")
        end
      end

      describe 'PATCH /api/v1/subscriptions/:id' do
        before do
          Rails.application.load_seed
        end
        before { patch '/api/v1/subscriptions/1' }
    
        it "updates subscription status to cancelled" do
          pretty = JSON.parse(response.body)
    
          expect(response).to have_http_status(200)
          expect(pretty["data"]["attributes"]["status"]).to eq("cancelled")
        end
      end

      describe 'GET /api/v1/customers/:customer_id/subscriptions' do
        before do
          Rails.application.load_seed
        end
        before { get '/api/v1/customers/2/subscriptions' }
    
        it "updates subscription status to cancelled" do
          pretty = JSON.parse(response.body)
    
          expect(response).to have_http_status(200)
          expect(pretty["subscription_list"]).to be_an(Array)
          expect(pretty["subscription_list"].count).to eq(2)
          expect(pretty["subscription_list"][0]["data"]["attributes"]["title"]).to eq("Green & Black Subscription")
          expect(pretty["subscription_list"][1]["data"]["attributes"]["title"]).to eq("Oolong & Green Subscription")
          expect(pretty["subscription_list"][0]["data"]["attributes"]["status"]).to eq("active")
          expect(pretty["subscription_list"][1]["data"]["attributes"]["status"]).to eq("cancelled")
        end
      end
    end

    context 'when the request is invalid' do
      describe 'POST /api/v1/customers/:customer_id/subscriptions' do
        before do
          Rails.application.load_seed
        end
        before { post '/api/v1/customers/1/subscriptions', params: invalid_json, as: :json }
  
        it "returns a 422 error" do
          pretty = JSON.parse(response.body)
  
          expect(response).to have_http_status(422)
          expect(pretty["error"]).to eq("Unprocessable")
        end
      end

      describe 'POST /api/v1/customers/:invalid_customer_id/subscriptions' do
        before do
          Rails.application.load_seed
        end
        before { post '/api/v1/customers/9999/subscriptions', params: valid_json, as: :json }
  
        it "returns a 404 error" do
          pretty = JSON.parse(response.body)
          
          expect(response).to have_http_status(404)
          expect(pretty["error"]).to eq("Customer not found")
        end
      end

      describe 'PATCH /api/v1/subscriptions/:invalid_id' do
        before do
          Rails.application.load_seed
        end
        before { patch '/api/v1/subscriptions/99999' }
    
        it "returns a 404 error" do
          pretty = JSON.parse(response.body)
    
          expect(response).to have_http_status(404)
          expect(pretty["error"]).to eq("Subscription not found")
        end
      end

      describe 'GET /api/v1/customers/:invalid_customer_id/subscriptions' do
        before do
          Rails.application.load_seed
        end
        before { get '/api/v1/customers/9999/subscriptions' }
    
        it "returns a 404 error" do
          pretty = JSON.parse(response.body)
    
          expect(response).to have_http_status(404)
          expect(pretty["error"]).to eq("Customer not found")
        end
      end
    end
  end
end