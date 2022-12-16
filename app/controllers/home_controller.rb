class HomeController < ApplicationController
  def index
  end

  def about
  end

  def _header
    @tutors = Tutor.all
    
  end
end
