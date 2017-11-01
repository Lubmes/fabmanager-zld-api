# Preview all emails at http://localhost:3000/rails/mailers/reservations_mailer
class ReservationsMailerPreview < ActionMailer::Preview

  def create_mail
    ReservationsMailer.create_mail(User.first, Reservation.first)
  end

  def approve_mail
    ReservationsMailer.approve_mail(User.first, Reservation.first)
  end

  def denied_mail
    ReservationsMailer.denied_mail(User.first, Reservation.first)
  end

end
