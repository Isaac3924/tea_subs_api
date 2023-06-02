class SubscriptionSerializer
  include JSONAPI::Serializer
  
  def self.format_subscription(subscription)
    {
      data: {
        type: 'subscriptions',
        id: subscription.id,
        attributes: {
          title: subscription.title,
          price: subscription.price,
          status: subscription.status,
          frequency: subscription.frequency
        }
      }
    }
  end

  def self.format_subscriptions(subscriptions)
    {
      subscription_list: subscriptions.map { |subscription| format_subscription(subscription) }
    }
  end
end