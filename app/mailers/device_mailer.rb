class DeviceMailer < ApplicationMailer
  def confirm_device
    @device = params[:device]
    @url  = confirm_free_device_url(uuid: @device.uuid,  device_token: @device.confirm_token)
    mail(to: @device.user.email, subject: 'Confirm device to DIIVTracker')
  end
end
