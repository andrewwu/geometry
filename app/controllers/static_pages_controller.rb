class StaticPagesController < ApplicationController
  def home
    @models = Model.all
  end
end
