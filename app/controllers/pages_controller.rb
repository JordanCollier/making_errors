class PagesController < ApplicationController
  # before_action :authenticate

  def index
    if current_user
    else
      raise NotLogged
    end
  end

end
