require 'swagger_helper'
describe 'Register API' do

  path '/reg' do

    post 'Get a token for new user' do
      tags 'New user token'
      consumes 'application/json', 'application/xml'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string }
        },
        required: [ 'name', 'email', 'password', 'password_confirmation' ]
      }

      response '201', 'Token created' do
        let(:user) { { name: 'Name', email: "email.@mail.com", password: "password", password_confirmation: "password" } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { email: "email.@mail.com", password: "password" } }
        run_test!
      end
    end
  end
end


describe 'Authenticate API' do

  path '/auth' do

    post 'Get a token' do
      tags 'Registered users token'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: ['email', 'password' ]
      }

      response '201', 'Token created' do
        let(:user) { { email: "email.@mail.com", password: "password" } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { email: "email.@mail.com" } }
        run_test!
      end
    end
  end
end


describe 'Comments API' do

  path '/posts/{id}/comments' do

    post 'Creates a comment' do
      tags 'Comments'
      security [bearerAuth: [] ]
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          content: { type: :string }
        },
        required: [ 'title', 'content' ]
      }

      response '201', 'comment created' do
        let(:Authorization) { "Basic #{::Base64.strict_encode64('jsmith:jspass')}" }
        let(:comment) { { content: 'bar' } }
        run_test!
      end

    end
  end

  path '/posts/{id}/comments' do

    get 'Retrieves a comments' do
      tags 'Comments', 'Another Tag'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'blog found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            content: { type: :string }
          },
          required: [ 'id', 'title', 'content' ]

        let(:id) { Comment.create(title: 'foo', content: 'bar').id }
        run_test!
      end

      response '404', 'blog not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end
