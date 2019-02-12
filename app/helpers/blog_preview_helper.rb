# frozen_string_literal: true

module BlogPreviewHelper
  def posts?
    @blog.last_post.present?
  end

  def posts_template
    posts? ? Templates::POSTS_CONTENT : Templates::POSTS_PLACEHOLDER
  end

  def post_preview_path(post_id)
    "/posts/#{post_id}/preview"
  end
end
