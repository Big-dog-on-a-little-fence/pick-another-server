module Api
  class JamsController < ApiController
    def show
      jam = Jam.find(params[:id])

      render json: jam, include: ['users', 'tunes']
    end

    def create
      jam = Jam.new(request_params)
      jam.tunes = tunes_in_common_between(jam.users)

      if jam.save
        render json: jam, status: :created, include: ['users', 'tunes']
      else
        render json: jam, serializer: ActiveModel::Serializer::ErrorSerializer, status: :unprocessable_entity
      end
    end

    private

    def request_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end

    def tunes_in_common_between(users)
      users.map(&:tunes).inject(:&)
    end
  end
end
