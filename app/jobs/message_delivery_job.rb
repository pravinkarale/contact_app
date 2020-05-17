class MessageDeliveryJob < ApplicationJob
  def perform(opts)
    UserMessageMailer.user_message(opts).deliver_now
  end
end
