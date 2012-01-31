class Notifier < ActionMailer::Base
  default :from => 'developers@helloample.com'
  
  def contact_notification(message)
    @message = message
    mail(
      :to => @message.to.email,
      :from => "#{@message.from} <#{@message.email}>",
      :subject => "[msaarch.com] #{@message.subject}"
    )
  end

end