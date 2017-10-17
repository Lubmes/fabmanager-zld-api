module Api
  module V1
    class ReservationsController < ApplicationController

      def index
        @reservations = Reservation.all
        render json: @reservations
      end



    end

  end

end
