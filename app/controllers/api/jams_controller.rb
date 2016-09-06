module Api
  class JamsController < ApiController
    def show
      jam = Jam.find(params[:id])
      render json: jam, include: ['users']
    end

    def create
      jam = Jam.new(request_params)
      if jam.save
        render json: jam, status: :created
      else
        render json: jam, serializer: ActiveModel::Serializer::ErrorSerializer, status: :unprocessable_entity
      end
    end

    private

    def request_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
  end
end
