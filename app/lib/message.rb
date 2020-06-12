# app/lib/message.rb
class Message
  def self.not_found(record = 'record')
    "Sorry, #{record} not found."
  end

  def self.invalid_credentials
    'Invalid credentials.'
  end

  def self.invalid_token
    'Invalid token.'
  end

  def self.invalid_context
    'Invalid context'
  end

  def self.missing_token
    'Missing token.'
  end

  def self.unauthorized
    'Unauthorized request.'
  end

  def self.account_created
    'Account created successfully.'
  end

  def self.account_not_created
    'Account could not be created.'
  end

  def self.expired_token
    'Sorry, your token has expired. Please login to continue.'
  end

  def self.must_change_password
    'You are supposed to supply new password and new password confirmation.'
  end

  def self.cannot_process
    'Your request cannot be processed.'
  end

  def self.confirm
    'Confirmed.'
  end

  def self.confirmed
    'Already confirmed.'
  end

  def self.unallowed_device
    'User can not have this type of device.'
  end

  def self.unsupported_action
    'Unsupported action.'
  end

  def self.not_last
    'This action can be performed only on last entry.'
  end

end
