# frozen_string_literal: true

module ApiHelpers
  module ElementHelpers
    attr_reader :current_element

    def find_current_element!
      @current_element = Element.find_by(id: params[:element_id])

      element_not_found! unless current_element

      element_not_found! unless element_of_current_blog?(current_element)
    end

    def element_of_current_blog?(element)
      element.container.post.blog_id == current_blog.id
    end
  end
end
