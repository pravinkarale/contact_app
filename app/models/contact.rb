class Contact < ApplicationRecord
  validates :first_name, :last_name, :email, :message, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, :numericality => true, :length => { :minimum => 10, :maximum => 15 }, allow_blank: true

  after_save :send_email, on: :create

  def full_name
    self.first_name + " " + self.last_name
  end

  def send_email
    MessageDeliveryJob.perform_later(self)
  end
end
