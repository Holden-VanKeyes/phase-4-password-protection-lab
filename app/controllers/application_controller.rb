class ApplicationController < ActionController::API
  include ActionController::Cookies
  before_action :authorize_user

  def authorize_user
   return render json: {error: "not authorized"}, status: :unauthorized unless session.include?(:user_id)
   

  end
 

end
