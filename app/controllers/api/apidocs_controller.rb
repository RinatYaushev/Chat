class Api::ApidocsController < ActionController::Base
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'API Chat'
      contact do
        key :name, 'MLSDev inc.'
      end
    end
    key :host, 'localhost:3000'
    key :basePath, '/api'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  SWAGGERED_CLASSES = [
    self,
    Apidocs::Users,
    Apidocs::Profile,
    Apidocs::Avatar,
    Apidocs::Relationships,
    Apidocs::Followers,
    Apidocs::Followees,
    Apidocs::Session,
    Apidocs::Rooms,
    Apidocs::Messages,
    Apidocs::Pings,
    Apidocs::Pictures,
    Apidocs::Votes
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
