# frozen_string_literal: true

module BlogCreatorApi
  class Root < Grape::API
    helpers BlogCreatorApi::Shared::BaseHelpers

    format :json
    rescue_from :all

    mount BlogCreatorApi::Blogs::V1
  end
end