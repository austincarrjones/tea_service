class Api::V1::SubscriptionsController < ApplicationController

  def create
    subscription = Subscription.new(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: :created
    else
      render json: { errors: subscription.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    binding.pry
    subscription = Subscription.find(params[:id])
    subscription.update(params[:status])
    render json: SubscriptionSerializer.new(subscription), status: :updated
  end

  private

  def subscription_params
    params.permit(:title, :frequency, :customer_id, :tea_id)
  end
end