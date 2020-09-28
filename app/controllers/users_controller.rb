class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
       if @user
          render json: {
            user: @user.format_to_json
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
            user: @user.format_to_json
          }
        else 
          render json: {
            status: 500,
            errors: @user.errors.full_messages
          }
        end
      end

      def update 
        user = User.all.find_by_id(params[:id])
        user.hourly_rate = params[:hourly_rate].to_f if params[:hourly_rate]
        
        user.save
        render json: {user: current_user.format_to_json}
      end

    private

    def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :phone_number, :is_cleaner, :hourly_rate)
    end
end
