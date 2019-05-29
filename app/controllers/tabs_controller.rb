class TabsController < ApplicationController
  def index

  end

  def new

  end

  def show
    @tab = Tab.find(params[:id])
  end

  def create

  end

  def update

  end
end
