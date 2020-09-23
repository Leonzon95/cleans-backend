class SessionsController < ApplicationController
    def create
        @user = User.find_by(username: session_params[:username])
        if @user && @user.authenticate(session_params[:password])
          login!
          render json: {
            logged_in: true,
            user: {
              id: @user.id,
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
            status: 401,
            errors: ['Your username or password is invalid']
          }
        end
    end

    def is_logged_in?
      if logged_in? && current_user
        render json: {
          logged_in: true,
          user: current_user
        }
      else
        render json: {
          logged_in: false,
          message: 'no such user'
        }
      end
    end

    def destroy
        logout!
        render json: {
          status: 200,
          logged_out: true
        }
    end

    private
    
    def session_params
      params.require(:user).permit(:username, :email, :password)
    end
end

