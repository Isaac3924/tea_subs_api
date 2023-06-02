class Api::V1::SubscriptionsController < ApplicationController
  before_action :set_customer, only: %i[create index]

  def create
    @subscription = @customer.subscriptions.create!(subscription_params)
    @subscription.teas << Tea.find(subscription_params[:tea_ids])
    render json: SubscriptionSerializer.format_subscription(@subscription), status: 201
  end

  def update
    @subscription = Subscription.find(params[:id])
    @subscription.update!(status: 'cancelled')
    render json: SubscriptionSerializer.format_subscription(@subscription), status: 200
  end

  def index
    @subscriptions = @customer.subscriptions
    render json: SubscriptionSerializer.format_subscriptions(@subscriptions), status: 200
  end

  private

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def subscription_params
    params.require(:subscriptions).permit(:title, :price, :status, :frequency, tea_ids: [])
  end
end
