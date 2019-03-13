# frozen_string_literal: true

module ApiHelpers
  module ContainerHelpers
    attr_reader :current_container

    def find_current_container!
      @current_container = Container.find_by(id: params[:container_id])

      if !current_container || container_of_current_blog?(current_container)
        container_not_found!
      end
    end

    def container_of_current_blog?(container)
      container.post.blog_id == current_blog.id
    end
  end
end