class SubtabsController < ApplicationController
  def index

  end

  def new

  end

  def show
    @sub_tab = SubTab.find(params[:id])
  end

  def create

  end

  def update

  end
end
