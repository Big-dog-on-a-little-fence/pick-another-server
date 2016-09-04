module Api
  class JamsController < ApiController
    def show
      jam = Jam.find(params[:id])
      render json: jam, include: ['users']
    end
  end
end
