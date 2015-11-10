class Mailer < ActionMailer::Base

  default from: "oc@oc.org"
  
  def notify(user,form,data,notification_kind,subject)
    @user=user
    @form=form
    @data=data

    # get all the admins related with the same notification and send notify to them
    Notification.where(notification_kind => true).each do |notify| 
      mail(to: notify.email , subject: subject).deliver
    end
    
  end

end