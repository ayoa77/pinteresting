class PinsController < ApplicationController
    before_action :set_pin, only: [:show, :edit, :update, :destroy]
    skip_before_action :verify_authenticity_token, only: :create
    def index
        @pins = Pin.order('created_at DESC')
        @pins = @pins.search_pins params[:query] if params[:query]
        @pin = Pin.new
    end

    def new
        @pin = Pin.new
    end

    def create
        @pin = current_user.pins.new(pin_params)
        @pins = Pin.order('created_at DESC')
        respond_to do |format|
            if @pin.save
                format.js
                format.html { render :index, notice: 'Pin was successfully created.' }
                format.json { render :show, status: :created, location: @pin }
            else
                format.html { render :index, notice: 'Something went wrong, please try again!' }
                format.json { render json: @pin.errors, status: :unprocessable_entity }
                format.js
            end
        end
    end

    def show; end

    def edit; end

    def update
        @pin.update(pin_params)
        redirect_to pin_path(@pin)
    end

    def destroy
        @pin.destroy
        respond_to do |format|
            format.html { redirect_to current_user, notice: 'Pin was successfully destroyed.' }
            format.json { head :no_content }
            format.js
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_pin
        @pin = Pin.find(params[:id])
    end

    def pin_params
        params.require(:pin).permit(:title, :description, :price, :image)
    end
end
