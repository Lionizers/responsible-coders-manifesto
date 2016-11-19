class SignupMailer < ActionMailer::Base
  default from: "nils@loewe.io"

  def verify_email(coder)
    @coder = coder
    @url = coders_verify_url(token: @coder.token, locale: I18n.locale)
    mail(to: @coder.email, subject: I18n.t('email.subject'))
  end

end
