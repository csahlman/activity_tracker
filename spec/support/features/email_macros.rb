module Features

  def last_email
  #   Delayed::Worker.new.work_off
    ActionMailer::Base.deliveries.last 
  end
  def all_email_recipients
    recipients = []
    ActionMailer::Base.deliveries.each do |delivery|
      recipients << delivery.to
    end
    recipients
  end

end