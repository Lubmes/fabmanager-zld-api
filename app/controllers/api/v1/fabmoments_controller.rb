module Api
  module V1
    class FabmomentsController < ApplicationController
      before_action :set_user, only: [:index, :create]
      before_action :set_fabmoment, only: [:show, :update, :destroy]

      # GET /fabmoments
      def index
        @fabmoments = @user.fabmoments.all
        render json: @fabmoments
      end

      # GET /fabmoments/1
      def show
        render json: @fabmoment
      end

      # POST /fabmoments
      def create
        @fabmoment = @user.fabmoments.new(fabmoment_params)

        if @fabmoment.save
          render json: @fabmoment, status: :created, location: @fabmoment
        else
          render json: @fabmoment.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /fabmoments/1
      def update
        if @fabmoment.update(fabmoment_params)
          render json: @fabmoment
        else
          render json: @fabmoment.errors, status: :unprocessable_entity
        end
      end

      # DELETE /fabmoments/1
      def destroy
        @fabmoment.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_fabmoment
          @fabmoment = Fabmoment.find(params[:id])
        end

        def set_user
          @user = User.find(params[:user_id])
        end

        # Only allow a trusted parameter "white list" through.
        def fabmoment_params
          params.require(:fabmoment).permit(:user_id, :title, :description)
        end
    end
  end
end
