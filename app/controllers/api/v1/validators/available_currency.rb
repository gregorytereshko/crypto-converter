class API::V1::Validators::AvailableCurrency < Grape::Validations::Base
  def validate_param!(attr_name, params)
    return if params[attr_name].blank?

    unless Rate.available_currencies.include?(params[attr_name])
      fail Grape::Exceptions::Validation,
           params: [@scope.full_name(attr_name)],
           message: 'Currency is invalid.'
    end
  end
end
