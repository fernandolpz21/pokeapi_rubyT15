class StaticPagesController < ApplicationController
    # include Authentication
  def home

    if user_signed_in?
      redirect_to pokemons_path
    else
      # You can set up an instance variable or any logic to display the login link or form in your view
      @login_path = login_path
    end
    
  end
end
