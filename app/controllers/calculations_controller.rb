class CalculationsController < ApplicationController
  def wood_price
    wood_price_calculator_params = params[:wood_price_calculator]

    if wood_price_calculator_params.present?
      @wood_price_calculator = WoodPriceCalculator.new(
        height: wood_price_calculator_params[:height],
        length: wood_price_calculator_params[:length],
        width: wood_price_calculator_params[:width],
        price_per_sai: wood_price_calculator_params[:price_per_sai]
      )

      @wood_price_calculator.valid?
    else
      @wood_price_calculator = WoodPriceCalculator.new
    end
  end
end
