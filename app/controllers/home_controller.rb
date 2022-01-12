class HomeController < ApplicationController

  def index
    @available_rooms = Room.first(10)
  end
end
