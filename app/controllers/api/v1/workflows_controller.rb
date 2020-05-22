# app/controllers/api/v1/workflows_controller.rb
# frozen_string_literal: true
module Api
  module V1
    class WorkflowsController < ApplicationController
      before_action :set_workflow, only: [:show, :update, :destroy]
      skip_authorization_check

      # GET /workflows
      def index
        @workflows = Workflow.all

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
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_workflow
        @workflow = Workflow.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def workflow_params
        params.require(:workflow).permit(:old_status_id, :new_status_id, :device_type_id)
      end
    end
  end
end
