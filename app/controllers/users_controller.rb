class UsersController < ApplicationController
    skip_before_action :authorize_user, only:[:create]
    rescue_from ActiveRecord::RecordInvalid, with: :handle_auth



    def create
        user = User.create!(user_params)
        # if user.valid?
        
        session[:user_id] = user.id
        
        render json: user, status: :created

    #     else
    #         render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    #  end

    
        
    end

    def show 
        
        user = User.find(session[:user_id])

    #  user = session[:user_id]

   
     
     render json: user
    end

    private

    def user_params
      params.permit(:username, :password, :password_confirmation)
    end

    def handle_auth
      render json: {error: 'password invalid'}, status: :unprocessable_entity
    end


end
