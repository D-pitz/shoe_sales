class TransController < ApplicationController
    before_action :require_login

    def create
        @tran = Tran.create(tran_params)
        if @tran.save
            redirect_to :back
        else
        flash[:errors] = @tran.errors.full_messages
        redirect_to :back
        end
        @shoe = @tran.shoe
        @shoe.update(purchased: true) 
        @tran.update(purchased: true)
    end

    private
    def tran_params
        params.require(:tran).permit(:buyer, :seller, :amount, :date, :name, :user_id, :shoe_id)
    end
end
