class Apidocs::Followers
  include Swagger::Blocks

  swagger_path '/followers' do
    operation :get do
      key :description, 'Show user followers'
      key :tags, ['relationships']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      response 200 do
        key :description, 'Followers'
        schema do
          key :type, :array
          items do
            key :'$ref', :OutputProfile
          end
        end
      end
    end
  end
end
