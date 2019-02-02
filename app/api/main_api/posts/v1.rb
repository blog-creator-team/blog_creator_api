# frozen_string_literal: true

module MainApi
  module Posts
    class V1 < Grape::API
      version 'v1', using: :path

      params do
        requires :blog_id, type: Integer
      end
      resources 'blogs/:blog_id/posts' do
        desc 'Create new post'
        params do
          requires :data, type: Hash do
            requires :title, type: String
          end
        end
        post do
          attributes = declared_params[:data]
          attributes[:blog_id] = params[:blog_id]
          Post.create!(attributes).short_attrs
        end

        desc 'Get all post for blog'
        get do
          blog = Blog.find params[:blog_id]
          blog.posts.map(&:short_attrs)
        end
      end

      params do
        requires :post_id, type: String
      end
      resources 'posts/:post_id' do
        desc 'Get all post data'
        get do
          Post.find(params[:post_id]).capture_attrs
        end

        desc 'Update post settings'
        params do
          requires :data, type: Hash do
            optional :title, type: String

            optional :offset_top, type: String
            optional :offset_right, type: String
            optional :offset_bottom, type: String
            optional :offset_left, type: String

            optional :bg_color, type: String
            optional :bg_image, type: String

            optional :thumbnail, type: String
          end
        end
        put do
          post = Post.find params[:post_id]
          post.update! declared_params[:data]
          post
        end

        desc 'Delete post'
        delete do
          Post.find(params[:post_id]).destroy!
          body false
        end
      end
    end
  end
end