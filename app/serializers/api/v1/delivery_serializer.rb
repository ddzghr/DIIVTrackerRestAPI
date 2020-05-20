# app/serializers/api/v1/delivery_serializer.rb
# frozen_string_literal: true
module Api
  module V1
    class DeliverySerializer < ActiveModel::Serializer
      #has_one :current_address
      attributes :id,
                 :uuid,
                 :amount_on_delivery,
                 :orderer_name,
                 :orderer_email,
                 :annotation,
                 :orderer,
                 :supplier,
                 :courier,
                 :current_address,
                 :from_address,
                 :to_address


      def current_address
        render_address(object.current_address.address)
      end

      def from_address
        render_address(object.from_address.address)
      end

      def to_address
        render_address(object.to_address.address)
      end

      def orderer
        render_user(object.orderer_id)
      end

      def supplier
        render_user(object.supplier_id)
      end

      def courier
        render_user(object.courier_id)
      end

      private

      def render_user(id)
        ShortUserSerializer.new(User.find(id), root: false) unless id.nil?
      end

      def render_address(address)
        AddressSerializer.new(address, root: false) unless address.nil?
      end

    end
  end
end
