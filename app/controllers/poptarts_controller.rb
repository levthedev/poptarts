class PoptartsController < ApplicationController
  respond_to :json
  def index
    respond_with Poptart.all
  end

  def show
    respond_with Poptart.find(params[:id])
  end
end
