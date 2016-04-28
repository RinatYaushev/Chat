class Apidocs::Users
  include Swagger::Blocks

  swagger_path '/users' do
    operation :get do
      key :description, 'List of users'
      key :tags, ['users']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :role
        key :in, :query
        key :description, 'Return collection of users with this role'
        key :type, :string
        key :enum, ::User.values_for_roles
      end
      response 200 do
        key :description, 'Users collection'
        schema do
          key :type, :array
          items do
            key :'$ref', :OutputProfile
          end
        end
      end
    end
  end

  swagger_path '/users' do
    operation :post do
      key :description, 'Create user'
      key :tags, ['users']
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
        key :description, 'User'
        schema do
          key :'$ref', :OutputProfile
        end
      end
    end
  end

  swagger_path '/users/{id}' do
    operation :get do
      key :description, 'Show user'
      key :tags, ['users']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :id
        key :in, :path
        key :description, 'User id'
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, 'User'
        schema do
          key :'$ref', :OutputProfile
        end
      end
    end
  end

  swagger_schema :InputUserSchema do
    key :required, [:user]
    property :user do
      key :type, :object
      key :'$ref', :InputUser
    end
  end

  swagger_schema :InputUser do
    key :required, [:name, :password, :email, :gender]
    property :name do
      key :type, :string
    end
    property :password do
      key :type, :string
    end
    property :email do
      key :type, :string
    end
    property :gender do
      key :type, :integer
      key :enum, [:man, :woman]
    end
    property :phone do
      key :type, :string
    end
  end
end
