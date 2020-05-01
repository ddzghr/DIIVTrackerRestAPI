# config/initializers/override_mail_recipient.rb

if Rails.env.development? or Rails.env.test?
  class OverrideMailRecipient
    def self.delivering_email(mail)
      mail.to = 'pero@ddhome.local'
    end
  end
  ActionMailer::Base.register_interceptor(OverrideMailRecipient)
end
