# frozen_string_literal: true

module PostViewModel
  class Container < ApplicationViewModel
    HTML_TEMPLATE = 'post/container/template'
    STYLES_TEMPLATE = 'post/container/styles'

    attr_accessor :elements, :publish_mode

    def initialize(model, publish_mode)
      super(model)
      self.publish_mode = publish_mode
      prepare_elements
    end

    def render_html
      render(partial: HTML_TEMPLATE, assigns: { container: self })
    end

    def render_styles
      render(partial: STYLES_TEMPLATE, assigns: { container: self })
    end

    private

    def permitted_model_attrs
      %i[id attrs]
    end

    def prepare_elements
      self.elements = model.elements_with_order.map do |element|
        element_view_model(element.kind).new(element, publish_mode)
      end
    end

    def element_view_model(element_kind)
      case element_kind.to_sym
      when :link
        PostViewModel::Element::Link
      when :text
        PostViewModel::Element::Text
      when :image
        PostViewModel::Element::Image
      else
        raise(BlogCreatorError, "Unknown element kind \"#{kind}\"")
      end
    end
  end
end
