class Notifier < ActionMailer::Base
  default :from => 'no-reply@msaarch.com'
  
  def contact_notification(message)
    @message = message
    mail(
      :to => CONTACT_EMAIL[Rails.env.intern],
      :from => "#{@message.from} <#{@message.email}>",
      :subject => "[msaarch.com] #{@message.subject}"
    )
  end

end