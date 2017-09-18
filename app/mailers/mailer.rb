class Mailer < ActionMailer::Base

  default from: "info@onlinecensorship.org"

  # Using to send notifications to the administrations
  def notify(user,form,data,notification_kind,subject)
    @user=user
    @form=form
    @data=data

    # get all the admins related with the same notification and send notify to them
    Notification.where(notification_kind => true).each do |notify|
      mail(to: notify.email , subject: subject).deliver
    end

  end

  # Using to send subscribe confirmation email
  def subscribe_confirmation(token,to,domain)
    @token=token
    @domain=domain
    mail(to: to, subject: "Verifying your email address").deliver
  end

end
