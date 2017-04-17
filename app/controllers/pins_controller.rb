class PinsController < ApplicationController
    def index
        @pins = Pin.order('created_at DESC')

        @pins = @pins.search_pins params[:query] if params[:query]
    end

    def new
        @pin = current_user.pins.new
    end

    def create
        @pin = current_user.pins.new(pin_params)
        if @pin.save
            redirect_to pin_path(@pin)
        else
            render 'new', notice: 'Sorry, something went wrong! Please try again.'
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
