class API::V1::Converter < Grape::API
  helpers API::V1::Helpers::Converter

  add_swagger_documentation(
    api_version: 'v1',
    version: 'v1',
    hide_documentation_path: true,
    hide_format: true,
    format: :json,
    info: {
      title: "Crypto Converter",
      description: 'Crypto Converter.'
    }
  )
  version 'v1', using: :path
  format :json


  resource :converters do
    desc 'Confirm erase personal information.'
    params { use :exchange }
    get :exchange do

    end
  end
end