class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAIL_FROM'], to: ENV['MAIL_TO']
  layout 'mailer'
end
