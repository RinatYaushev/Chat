class Apidocs::Session
  include Swagger::Blocks

  swagger_path '/session' do
    operation :post do
      key :description, 'Generate authorization token'
      key :tags, ['session']
      parameter do
        key :name, :session
        key :in, :body
        key :description, 'Session parameters'
        key :required, true
        schema do
          key :'$ref', :InputSession
        end
      end
      response 200 do
        key :description, 'Session response'
        schema do
          key :'$ref', :OutputSession
        end
      end
      response 422 do
        schema do
          key :'$ref', :SessionErrors
        end
      end
    end
  end

  swagger_path '/session' do
    operation :delete do
      key :description, 'Destroy session'
      key :tags, ['session']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
    end
  end

  swagger_schema :InputSession do
    key :required, [:session]
    property :session do
      key :type, :object
      key :properties, {
        email: {
          type: :string
        },
        password: {
          type: :string
        }
      }
    end
  end

  swagger_schema :OutputSession do
    key :required, [:auth_token]
    property :auth_token do
      key :type, :string
    end
  end

  swagger_schema :SessionErrors do
    property :errors do
      property :email do
        key :type, :array
        items do
          key :type, :string
        end
      end
      property :password do
        key :type, :array
        items do
          key :type, :string
        end
      end
    end
  end
end
