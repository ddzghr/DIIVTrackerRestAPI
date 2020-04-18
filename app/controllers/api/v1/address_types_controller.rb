#  app/controllers/api/v1/address_types_controller.rb
module Api
  module V1
    class AddressTypesController < ApplicationController
      before_action :set_address_type, only: [:show, :update, :destroy]

      # GET /api/v1/address-types
      def index
        @address_types = AddressType.all

        render json: @address_types
      end

      # GET /api/v1/address-types/1
      def show
        render json: @address_type
      end

      # POST /api/v1/address-types
      def create
        @address_type = AddressType.new(address_type_params)
        if @address_type.save
          render json: @address_type, status: :created, location: @address_type
        else
          render json: @address_type.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/address-types/1
      def update
        if @address_type.update(address_type_params)
          render json: @address_type
        else
          render json: @address_type.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/address-types/1
      def destroy
        @address_type.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_address_type
        @address_type = AddressType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def address_type_params
        params.require(:address_type).permit(:code, :name)
      end
    end
  end
end