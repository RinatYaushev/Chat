class Apidocs::Replies
  include Swagger::Blocks

  swagger_path '/comments/{comment_id}/replies' do
    operation :get do
      key :description, 'List of replies'
      key :tags, ['replies']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :comment_id
        key :in, :path
        key :description, 'Comment id'
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, 'Replies collection'
        schema do
          key :type, :array
          items do
            key :'$ref', :OutputReply
          end
        end
      end
    end
  end

  swagger_path '/comments/{comment_id}/replies' do
    operation :post do
      key :description, 'Create reply'
      key :tags, ['replies']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :comment_id
        key :in, :path
        key :description, 'Comment id'
        key :required, true
        key :type, :integer
      end
      parameter do
        key :name, :reply
        key :in, :body
        key :description, 'Reply params'
        key :required, true
        schema do
          key :'$ref', :InputReplySchema
        end
      end
      response 200 do
        key :description, 'Reply'
        schema do
          key :'$ref', :OutputReply
        end
      end
      response 422 do
        schema do
          key :'$ref', :CommentErrors
        end
      end
    end
  end

  swagger_schema :InputReplySchema do
    key :required, [:reply]
    property :reply do
      key :type, :object
      key :properties, {
        content: {
          type: :string
        }
      }
    end
  end
end
