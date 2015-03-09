class PagesController < ApplicationController

  def index
    raise AccessDenied
  end

end
