# frozen_string_literal: true

class RootApi < BaseApi
  format :json
  # rescue_from :all
  prefix 'api'

  helpers ApiHelpers::CommonHelpers
  helpers ApiHelpers::ErrorResponses
  helpers ApiHelpers::AuthHelpers
  helpers ApiHelpers::BlogHelpers

  mount ApiMain::ApiV1

  add_swagger_documentation(mount_path: '/swagger_doc', host: '')
end
