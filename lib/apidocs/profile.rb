class Apidocs::Profile
  include Swagger::Blocks

  swagger_path '/profile' do
    operation :get do
      key :description, 'Show profile'
      key :tags, ['profile']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      response 200 do
        key :description, 'Profile'
        schema do
          key :'$ref', :OutputProfile
        end
      end
    end
  end

  swagger_path '/profile' do
    operation :patch do
      key :description, 'Update profile'
      key :tags, ['profile']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :user
        key :in, :body
        key :description, 'User params'
        key :required, true
        schema do
          key :'$ref', :InputUserSchema
        end
      end
      response 200 do
        key :description, 'Profile'
        schema do
          key :'$ref', :OutputProfile
        end
      end
    end
  end

  swagger_schema :OutputProfile do
    key :required, %I[id email name messages_count pings_count purchases_count orders_count followers_count followers_count
      followees_count pictures_count phone gender roles avatar active_relationships passive_relationships]
    property :id do
      key :type, :integer
    end
    property :email do
      key :type, :string
    end
    property :name do
      key :type, :string
    end
    property :messages_count do
      key :type, :integer
    end
    property :pings_count do
      key :type, :integer
    end
    property :purchases_count do
      key :type, :integer
    end
    property :orders_count do
      key :type, :integer
    end
    property :followers_count do
      key :type, :integer
    end
    property :followees_count do
      key :type, :integer
    end
    property :pictures_count do
      key :type, :integer
    end
    property :phone do
      key :type, :string
    end
    property :gender do
      key :type, :integer
      key :enum, [:man, :woman]
    end
    property :roles do
      key :type, :array
      items do
        key :type, :integer
      end
    end
    property :avatar do
      key :type, :string
    end
    property :active_relationships do
      key :type, :array
      items do
        key :'$ref', :OutputRelationship
      end
    end
    property :passive_relationships do
      key :type, :array
      items do
        key :'$ref', :OutputRelationship
      end
    end
  end
end
