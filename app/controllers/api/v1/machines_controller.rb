module Api
  module V1
    class MachinesController < ApplicationController
      before_action :set_machine, only: [:show, :update, :destroy]

      # GET /machines
      def index
        @machines = Machine.all

        render json: @machines, include: [:usage]
      end

      # GET /machines/1
      def show
        render json: @machine
      end

      # POST /machines
      def create
        @machine = Machine.new(machine_params)

        if @machine.save
          render json: @machine, status: :created, location: @machine
        else
          render json: @machine.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /machines/1
      def update
        if @machine.update(machine_params)
          render json: @machine
        else
          render json: @machine.errors, status: :unprocessable_entity
        end
      end

      # DELETE /machines/1
      def destroy
        @machine.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_machine
          @machine = Machine.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def machine_params
          params.require(:machine).permit(:name, :usage, :capacity)
        end
    end
  end
end
