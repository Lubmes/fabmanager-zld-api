class ReservationsMailer < ApplicationMailer

  def create_mail(user)
    @user = user
    mail(to: 'lkisters@student.scalda.nl', subject: 'Huur verzoek is aangemaakt.')
  end

  def denied_mail
    if Reservation.approved == false
      @reservation = reservation

      mail(to: @user.email, subject: 'Huur verzoek is afgewezen.')
    end
  end

end
