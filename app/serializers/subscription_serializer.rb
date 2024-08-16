class SubscriptionSerializer
  include JSONAPI::Serializer
    attributes :title, :customer_id, :tea_id, :status, :frequency, :price
end