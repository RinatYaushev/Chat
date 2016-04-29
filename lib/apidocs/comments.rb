class Apidocs::Comments
  include Swagger::Blocks

  swagger_path '/products/{product_id}/comments' do
    operation :get do
      key :description, 'List of comments'
      key :tags, ['comments']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :product_id
        key :in, :path
        key :description, 'Product id'
        key :required, true
        key :type, :integer
      end
      response 200 do
        key :description, 'Comments collection'
        schema do
          key :type, :array
          items do
            key :'$ref', :OutputComment
          end
        end
      end
    end
  end

  swagger_path '/products/{product_id}/comments' do
    operation :post do
      key :description, 'Create comment'
      key :tags, ['comments']
      parameter do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'Input example: Token token="value"'
        key :required, true
        key :type, :string
        key :default, 'Token token="value"'
      end
      parameter do
        key :name, :product_id
        key :in, :path
        key :description, 'Product id'
        key :required, true
        key :type, :integer
      end
      parameter do
        key :name, :comment
        key :in, :body
        key :description, 'Comment params'
        key :required, true
        schema do
          key :'$ref', :InputCommentSchema
        end
      end
      response 200 do
        key :description, 'Comment'
        schema do
          key :'$ref', :OutputComment
        end
      end
      response 422 do
        schema do
          key :'$ref', :CommentErrors
        end
      end
    end
  end

  swagger_schema :InputCommentSchema do
    key :required, [:comment]
    property :comment do
      key :type, :object
      key :'$ref', :InputComment
    end
  end

  swagger_schema :InputComment do
    key :required, [:content]
    property :content do
      key :type, :string
    end
  end

  swagger_schema :OutputComment do
    key :required, [:id, :content, :user_id, :product_id, :replies]
    property :id do
      key :type, :integer
    end
    property :content do
      key :type, :string
    end
    property :user_id do
      key :type, :integer
    end
    property :product_id do
      key :type, :integer
    end
    property :replies do
      key :type, :array
      items do
        key :'$ref', :OutputReply
      end
    end
  end

  swagger_schema :OutputReply do
    key :required, [:id, :content, :user_id, :parent_id, :replies]
    property :id do
      key :type, :integer
    end
    property :content do
      key :type, :string
    end
    property :user_id do
      key :type, :integer
    end
    property :parent_id do
      key :type, :integer
    end
    property :replies do
      key :type, :array
      items do
        key :'$ref', :OutputLastReply
      end
    end
  end

  swagger_schema :OutputLastReply do
    key :required, [:id, :content, :user_id, :parent_id, :replies]
    property :id do
      key :type, :integer
    end
    property :content do
      key :type, :string
    end
    property :user_id do
      key :type, :integer
    end
    property :parent_id do
      key :type, :integer
    end
    property :replies do
      key :type, :array
      items do
      end
    end
  end

  swagger_schema :CommentErrors do
    property :errors do
      property :content do
        key :type, :array
        items do
          key :type, :string
        end
      end
    end
  end
end
