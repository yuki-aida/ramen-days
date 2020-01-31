class StaticPagesController < ApplicationController
  def home
    @shops = Shop.all
  end

  def about
  end

  def contact
  end
end
