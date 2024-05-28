class TaskMailer < ApplicationMailer
  def mailer(admin, user)
    mail(to: admin.email, subject: "Новое заявление на отпуск/отгул от сотрудника #{user}")
  end
end
