module Api
  class UsersController < ApiController
    def index
      if params[:starts_with].present?
        render json: User.starts_with(params[:starts_with])
      else
        render json: User.all
      end
    end
  end
end
