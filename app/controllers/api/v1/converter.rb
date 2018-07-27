class API::V1::Converter < Grape::API
  helpers API::V1::Helpers::Converter

  ERROR_CODE = 403

  resource :converters do
    desc 'Convert currencies.'
    params { use :exchange }
    get :exchange do
      converter_service = CurrencyConverter.new(params[:from], params[:to], params[:amount])
      converter_service.call
      
      error!({
        error: converter_service.error
      }, ERROR_CODE) if converter_service.error

      {
        currency: params[:to],
        amount: converter_service.result
      }
    end

    desc 'Available currencies.'
    get :currencies do
      Rate.available_currencies
    end

    desc 'Convertion history.'
    params { use :history }
    get :history do
      ::ConvertionHistoryFormatter.new(params[:limit]).view_data
    end
  end
  
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
  version 'v1', using: :header, vendor: :api
  format :json
end