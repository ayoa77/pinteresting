class PinsController < ApplicationController
  skip_before_action :verify_authenticity_token
    def index
        @pins = Pin.order('created_at DESC')
        @pins = @pins.search_pins params[:query] if params[:query]
        @pin = current_user.pins.new
    end

    def new
        @pin = Pin.new
    end

    def create
        @pin = current_user.pins.new(pin_params)
    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render :show, status: :created, location: @pin }
        format.js
      else
        format.html { render :new }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
        format.js
      end
    end
    end

    def show
        @pin = Pin.find(params[:id])
    end

    def edit
      @pin = Pin.find(params[:id])
  end
  def update
    @pin = Pin.find(params[:id])
    @pin.update(pin_params)
    redirect_to pin_path(@pin)
  end

    private

    def pin_params
        params.require(:pin).permit(:title, :description, :price, :image)
    end
end
