# app/controllers/api/v1/workflows_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class WorkflowsController < ApplicationController
      before_action :set_workflow, only: [:show, :update, :destroy]
      load_and_authorize_resource

      # GET /workflows
      def index
        @workflows = @workflows.joins(:device_type)
                               .where(device_types: { internal_api_server_type: false,
                                                      internal_web_server_type: false })
        render json: @workflows
      end

      # GET /workflows/1
      def show
        render json: @workflow
      end

      # POST /workflows
      def create
        @workflow = Workflow.new(workflow_params)

        if @workflow.save
          render json: @workflow, status: :created #, location: @workflow
        else
          render json: @workflow.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /workflows/1
      def update
        if @workflow.update(workflow_params)
          render json: @workflow
        else
          render json: @workflow.errors, status: :unprocessable_entity
        end
      end

      # DELETE /workflows/1
      def destroy
        @workflow.destroy
        render json: @workflow, status: :ok
      end

      private

      def check_internal_device
        unless @workflow.device_type.internal_api_server_type == false && @workflow.device_type.internal_web_server_type == false
          # Always hide admin roles
          id = @workflow.id
          @workflow = nil
          raise ActiveRecord::RecordNotFound, "Couldn't find Workflow with 'id'=#{id}"
        end
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_workflow
        @workflow = Workflow.find(params[:id])
        check_internal_device
      end

      # Only allow a trusted parameter "white list" through.
      def workflow_params
        params.require(:workflow).permit(:old_status_id,
                                         :new_status_id,
                                         :device_type_id)
      end
    end
  end
end
