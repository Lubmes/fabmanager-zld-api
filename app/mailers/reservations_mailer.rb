class ReservationsMailer < ApplicationMailer

  def create_mail(user, reservation)
    @user = user
    @reservation = reservation
    mail(to: 'lkisters@student.scalda.nl', subject: 'Huur verzoek is aangemaakt.')
  end

  def approve_mail(user, reservation)
    @user = user
    @reservation = reservation
    mail(to: 'lkisters@student.scalda.nl', subject: 'Uw huur verzoek is geaccepteerd.')
  end

  def denied_mail(user, reservation)
    @user = user
    @reservation = reservation
    mail(to: @user.email, subject: 'Huur verzoek is afgewezen.')
  end

end
