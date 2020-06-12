# config/initializers/override_mail_recipient.rb

if Rails.env.development? or Rails.env.test?
  class OverrideMailRecipient
    def self.delivering_email(mail)
      mail.to = 'ddzghr@gmail.com'
    end
  end
  ActionMailer::Base.register_interceptor(OverrideMailRecipient)
end
