class MailJob < ActiveJob::Base
  queue_as :mailer

  def perform(user_id, opts={})
    UserMailer.welcome(user_id).deliver
  end

end