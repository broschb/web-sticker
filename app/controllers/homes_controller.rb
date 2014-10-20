class HomesController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index, :register]

  def index
    if current_user
      redirect_to scribblets_path
    else
      render :layout => false
    end
  end

  def register
    email = params['fieldEmail']
    User.register(email)
    flash[:notice] = "Thank you for signing up!  We'll let you know when we are ready."
    redirect_to action: 'index'
  end

end
