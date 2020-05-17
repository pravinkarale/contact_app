class Contact < ApplicationRecord
  validates :first_name, :last_name, :email, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  after_save :send_email, on: :create

  def send_email
    MessageDeliveryJob.perform_later(self)
  end

  def full_name
    self.first_name + " " + self.last_name
  end
end
