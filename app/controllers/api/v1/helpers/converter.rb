require_dependency 'api/v1/validators/available_currency'

module API::V1::Helpers::Converter
  extend Grape::API::Helpers

  params :exchange do
    requires :from,   type: String, desc: 'Currency from which you want to convert', allow_blank: false, available_currency: true
    requires :to,     type: String, desc: 'Currency to which you want to convert',   allow_blank: false, available_currency: true
    requires :amount, type: Float,  desc: 'Amount of money you want to convert.',    allow_blank: false
  end

  params :history do
    optional :limit, type: Integer, desc: 'A number of records', default: 10
  end
end