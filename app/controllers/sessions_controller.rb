class SessionsController < ApplicationController
    skip_before_action :authorize_user, only: [:create]

    def create 
      user = User.find_by(username: params[:username])
      if user&.authenticate(params[:password]) 
      session[:user_id] = user.id
      render json: user
     else
        render json: {error: "invalid"}, status: :unauthorized
     end
    end

    def destroy
     session.clear
    end
end
