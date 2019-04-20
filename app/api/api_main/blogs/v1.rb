# frozen_string_literal: true

module ApiMain
  module Blogs
    class V1 < BaseApi
      resources :blog do
        desc 'Create new blog'
        params do
          requires :name, type: String
          requires :author, type: String
        end
        post do
          params = declared_params
          params[:user] = current_user
          blog = Blog.create!(params)
          present(:blog, blog, with: ApiEntities::Blog::Blog)
        end

        before { find_current_blog! }

        desc 'Homepage preview'
        content_type :html, 'text/html'
        format :html
        get :preview do
          ApplicationController.render(
            template: 'blog/index',
            assigns: { blog: current_blog.template_representation },
            layout: 'blog'
          )
        end
      end
    end
  end
end
