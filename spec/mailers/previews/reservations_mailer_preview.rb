# Preview all emails at http://localhost:3000/rails/mailers/reservations_mailer
class ReservationsMailerPreview < ActionMailer::Preview

  def create_mail
    ReservationsMailer.create_mail(User.first)
  end

end
