class ApplicationMailer < ActionMailer::Base
  default from: 'nonotify@vault-tec.tech'
  layout 'mailer'
end
