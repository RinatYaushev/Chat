class Apidocs::Relationships
  include Swagger::Blocks

  swagger_path '/relationships' do
    operation :post do
      key :description, 'Follow other user'
      key :tags, ['relationships']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :relationship
        key :in, :body
        key :description, 'Relationship params'
        key :required, true
        schema do
          key :'$ref', :InputRelationshipSchema
        end
      end
      response 200 do
        key :description, 'Relationship'
        schema do
          key :'$ref', :OutputRelationship
        end
      end
    end
  end

  swagger_path '/relationships/{id}' do
    operation :delete do
      key :description, 'Unfollow other user'
      key :tags, ['relationships']
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
        key :description, 'Relationship id'
        key :required, true
        key :type, :integer
      end
    end
  end

  swagger_schema :InputRelationshipSchema do
    key :required, [:relationship]
    property :relationship do
      key :type, :object
      key :properties, {
        followee_id: {
          type: :integer
        }
      }
    end
  end

  swagger_schema :OutputRelationship do
    key :required, [:id, :follower_id, :followee_id]
    property :id do
      key :type, :integer
    end
    property :follower_id do
      key :type, :integer
    end
    property :followee_id do
      key :type, :integer
    end
  end
end
