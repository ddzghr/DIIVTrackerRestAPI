# app/serializers/api/v1/device_serializer.rb
# frozen_string_literal: true
module Api
  module V1
    class DeviceSerializer < ActiveModel::Serializer
      attributes :id, :uuid, :secret_token_digest, :name, :valid_from, :valid_through, :device_active, :device_confirmed, :confirm_token, :device_locked, :unlock_token
      has_one :user
      has_one :device_type
    end
  end
end
