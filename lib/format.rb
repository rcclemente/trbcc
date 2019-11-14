class Format
  def self.test(value = 13)
    o = Format.new value
    p o.brand_orders
    p "test"
  end

  def initialize(quantity)
    @quantity = (quantity.to_i > 0) ? quantity.to_i : 0
  end

  def brand_orders
    return [] if @quantity <= 0
    orders = []

    # sets = bundle.keys
    # sets.each do |set|
    #   count = @quantity / set
    #   return if count == 0
    #
    #   if count > 0
    #     orders << { set_size: set, count: count, amount: (count * bundle[set]) }
    #   end
    # end

    orders
  end

  def get_order_for_quantity(quantity)
    value = quantity
  end

  def find_bundle_for_quantity(value)

  end

  def code
    # raise "No Format Code for this class"
    "VID"
  end

  def bundle
    # raise "No Format Bundle for this class"
    {
      3 => 570,
      5 => 900,
      9 => 1530,
    }
  end
end
