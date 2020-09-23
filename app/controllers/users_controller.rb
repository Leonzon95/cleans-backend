class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
       if @user
          render json: {
            user: @user
          }
        else
          render json: {
            status: 500,
            errors: ['user not found']
          }
        end
      end
      
      def create
        @user = User.new(user_params)
        if @user.save
          login!
          render json: {
            status: :created,
            user: {
              username: @user.username,
              email: @user.email,
              firstName: @user.first_name,
              lastName: @user.last_name,
              isCleaner: @user.is_cleaner,
              phoneNumber: @user.phone_number
            }
          }
        else 
          render json: {
            status: 500,
            errors: @user.errors.full_messages
          }
        end
      end

    private

    def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :phone_number, :is_cleaner)
    end
end
