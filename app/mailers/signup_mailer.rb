class SignupMailer < ActionMailer::Base
  default from: "nils@loewe.io"

  def verify_email(coder)
    @coder = coder
    @url = coders_verify_url(token: @coder.token)
    mail(to: @coder.email, subject: 'Sign the Manifesto for Responsible Software Development')
  end

end
