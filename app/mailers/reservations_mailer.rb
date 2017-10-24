class ReservationsMailer < ApplicationMailer

  def create_mail(user)
    @user = user
    mail(to: 'lkisters@student.scalda.nl', subject: 'Huur verzoek is aangemaakt.')
  end

  def approve_mail(user)
    @user = user
    mail(to: @user.mail, subject: 'Uw huur verzoek is geaccepteerd.')
  end

  def denied_mail(user)
    @user = user
    @reservation = reservation

    mail(to: @user.email, subject: 'Huur verzoek is afgewezen.')
  end

end
