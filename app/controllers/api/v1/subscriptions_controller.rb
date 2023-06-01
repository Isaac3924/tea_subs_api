class Api::V1::Subscriptions < Api::V1::ApplicationController
  def create
    @customer = Customer.find(params[:customer_id])
    @subscription = @customer.subscriptions.create!(subscription_params)
    @subscription.teas << Tea.find(params[:tea_ids])
    render json: SubscriptionSerializer.new(@subscription), status: 201
  end

  private

  def subscription_params
    params.require(:subscriptions).permit(:title, :price, :status, :frequency)
  end
end
