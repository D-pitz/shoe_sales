class UsersController < ApplicationController

    def create
        @user = User.create(user_params)
        if @user.save
            flash[:success] = "#{@user.first_name} successfully created."
            session[:user] = @user.id
            redirect_to '/'
        else 
            flash[:errors] = @user.errors.full_messages
            redirect_to :back
        end
    end

    def sessions
        if @user = User.find_by_email(user_login[:email]).try(:authenticate, user_login[:password])
          session[:user] = @user.id
          flash[:success] = "#{@user.first_name} successfully logged in."
          redirect_to "/users/#{@user.id}"
        else
          flash[:error] = "Name or Password incorrect"
          redirect_to :back
        end
    end

    def show
        @shoes = Shoe.where(user_id: current_user.id, purchased: false)
        @purchases = Tran.where(buyer: current_user.first_name, purchased: true)
        @sales = Tran.where(seller: current_user.first_name, user_id: current_user.id)
        @total_sales = 0
        @total_purchased = 0
        @sales.each do |sale|
            @total_sales += sale.amount
        end
        @purchases.each do |purchase|
            @total_purchased += purchase.amount
        end
    end

    def destroy
        reset_session
        flash[:success] = "Successfully logged out."
        redirect_to "/users/new"
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def user_login
        params.require(:user).permit(:email, :password)
    end

end
