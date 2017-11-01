module Api
  module V1
    class ReservationsController < ApplicationController
      before_action :set_user, only: [:create]
      before_action :set_reservation, only: [:approve, :deny]

      def index
        @reservations = Reservation.all
        render json: @reservations
      end

      def create
          @reservation = Reservation.create(reservation_params)

        ReservationsMailer.create_mail(@user, @reservation).deliver_now
      end


      def approve
        if @reservation.approve != true
          @reservation.approved = true

            ReservationsMailer.approve_mail(@user, @reservation).deliver_later
        end
      end


      def deny
        if @reservation.approve != false
          @reservation.approved = false

          ReservationsMailer.denied_mail(@user, @reservation).deliver_now
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:user_id])
      end

      def set_reservation
        @reservation = Reservation.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def reservation_params
        params.require(:reservation).permit(:title, :description, :start_time, :end_time, :approved, :user_id)
      end
    end
  end
end
