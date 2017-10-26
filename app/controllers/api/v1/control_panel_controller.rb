module Api
  module V1
    class ControlPanelController < ApplicationController
      before_action :usage,

      def show
        @control_panel = ControlPanel.last
        render json: @control_panel,
                     include: [
                       :weekly_time_tables => { include: :returning_activities } ]
      end

      def update
        @control_panel = ControlPanel.find(params[:id])
        if @control_panel.update(control_panel_params)
          render json: @control_panel
        else
          render json: @control_panel.errors, status: :unprocessable_entity
        end
      end

      def open_time

      end

      def end_open_time
        if Machine.open_hour = false
          @usages = Usage
          @usages.in_use = 0
        end

      end

      private

      # Only allow a trusted parameter "white list" through.
      def machine_params
        params.require(:control_panel).permit(
          :max_machines_to_occupy, :max_minutes_to_occupy_one_machine, :open_hour)
      end
    end
  end
end
