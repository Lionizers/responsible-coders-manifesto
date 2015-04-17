class PagesController < ApplicationController

  def index
    @coders = Coder.where(Coder.arel_table[:verified].eq(true))
    @coder = Coder.new
  end

  def sign
    @coder = Coder.new
  end

  def check
  end

end
