module Api
  module V1

    class WeeklyTimeTablesController < ApplicationController
      def show
        @weekly_time_table = WeeklyTimeTable.find(params[:id])
        render json: @weekly_time_table, include: [:returning_activities]
      end

    end

  end
end
