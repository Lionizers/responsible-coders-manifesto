# == Schema Information
#
# Table name: coders
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  token      :string(255)
#  verified   :boolean          default(FALSE)
#  email_hash :string(255)
#

class CodersController < ApplicationController

  # Called from sign-form
  def create
    @coder = Coder.new(coder_params)
    @coder.save
    SignupMailer.verify_email(@coder).deliver
  end

  def create_coder_successful(_)
    respond_to do |format|
      format.js
    end
  end

  alias_method :create_coder_failed, :create_coder_successful

  # Called from email-link
  def verify
    @coder = Coder.find_by token: params[:token]

    unless @coder.verified?
      @coder.verified = true
      @coder.email = "obfuscated"
      @coder.save
      flash[:signed_up] = true
    end

    redirect_to :controller => 'pages', :action => 'index', :anchor => 'signers'
  end

  private

    def coder_params
      params.require(:coder).permit(:name, :email, :location, :token)
    end

end
