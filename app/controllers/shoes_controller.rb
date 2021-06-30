class ShoesController < ApplicationController
    before_action :require_login

    def create
        @shoe = Shoe.create(shoe_params)
        if @shoe.save
            redirect_to :back
        else
        flash[:errors] = @shoe.errors.full_messages
        redirect_to :back
        end
    end

    def index
        @shoes = Shoe.where(purchased:false)
    end

    def destroy
        @shoe = Shoe.find(params[:id])
        if current_user == @shoe.user
            @shoe.destroy
            redirect_to :back
        else
            flash[:alert] = "Stop it."
            redirect_to :back
        end
    end

    private
    def shoe_params
        params.require(:shoe).permit(:name, :amount, :date, :user_id)
    end

end
