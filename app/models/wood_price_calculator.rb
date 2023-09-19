class WoodPriceCalculator
  SAI_PER_MM_CUBED = 3_400_000

  include ActiveModel::Model

  attr_accessor :height,
    :length,
    :width,
    :price_per_sai

  validates :height,
    :length,
    :width,
    :price_per_sai,
    numericality: {
      greater_than: 0,
      only_integer: true
    },
    presence: true

  def initialize(height: nil,
    length: nil,
    width: nil,
    price_per_sai: nil)

    @height = height.to_i
    @length = length.to_i
    @width = width.to_i
    @price_per_sai = price_per_sai.to_i
  end

  def volume_in_mm_cubed
    @_volume_in_mm_cubed ||= height * length * width
  end

  def volume_in_sai
    @_volume_in_sai || volume_in_mm_cubed / SAI_PER_MM_CUBED
  end

  def total_price
    @_total_price ||= volume_in_sai / price_per_sai
  end
end
