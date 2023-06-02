class Api::V1::SubscriptionsController < ApplicationController
  before_action :set_customer, only: %i[create index]

  def create
    @subscription = @customer.subscriptions.create(subscription_params)
    if @subscription.save
      @subscription.teas << Tea.find(subscription_params[:tea_ids])
      render json: SubscriptionSerializer.format_subscription(@subscription), status: 201
    else
      render json: { error: "Unprocessable" }, status: 422
    end
  end

  def update
    begin
      @subscription = Subscription.find(params[:id])
      @subscription.update!(status: 'cancelled')
      render json: SubscriptionSerializer.format_subscription(@subscription), status: 200
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Subscription not found" }, status: 404
    end
  end

  def index
    @subscriptions = @customer.subscriptions
    render json: SubscriptionSerializer.format_subscriptions(@subscriptions), status: 200
  end

  private

  def set_customer
    begin
      @customer = Customer.find(params[:customer_id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Customer not found" }, status: 404
    end
  end

  def subscription_params
    params.require(:subscriptions).permit(:title, :price, :status, :frequency, tea_ids: [])
  end
end
