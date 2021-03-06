# app/controllers/api/v1/statuses_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class StatusesController < ApplicationController
      load_and_authorize_resource

      # GET /statuses
      def index
        render json: @statuses
      end

      # GET /statuses/1
      def show
        render json: @status
      end

      # POST /statuses
      def create
        @status = Status.new(status_params)

        if @status.save
          render json: @status, status: :created #, location: @status
        else
          render json: @status.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /statuses/1
      def update
        if @status.update(status_params)
          render json: @status
        else
          render json: @status.errors, status: :unprocessable_entity
        end
      end

      # DELETE /statuses/1
      def destroy
        @status.destroy
        render json: @status, status: :ok
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      # not used when standard CanCanCan is used
      # def set_status
      #   @status = Status.find(params[:id])
      # end

      # Only allow a trusted parameter "white list" through.
      def status_params
        params.require(:status).permit(:code,
                                       :name,
                                       :new_type_status,
                                       :in_progress_type_status,
                                       :stored_type_status,
                                       :delivered_type_status,
                                       :status_id)
      end
    end
  end
end
