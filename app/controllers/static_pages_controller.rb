class StaticPagesController < ApplicationController
  def home
  end

  def help
  	@helf = help_path
  end

  def about
  end

  def contact
  end
end
