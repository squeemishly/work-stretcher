class StretchesController < ApplicationController
  def index
    @stretches = Stretch.all
  end
end
