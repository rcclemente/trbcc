class Format
  def self.test(value = 13)
    o = Format.new value
    p o.brand_orders
    p "test"
  end

  def initialize(quantity)
    @quantity = (quantity.to_i > 0) ? quantity.to_i : 0
    @orders = []
  end

  def brand_orders
    return [] if @quantity <= 0


    quantity = @quantity
    loop do
      break unless (order = find_order_for_quantity(quantity))

      # check if there is a remaining value to evaluate
      quantity = quantity % order[:set_key]

      @orders << order
    end

    @orders
  end

  def find_order_for_quantity(quantity)
    return nil if quantity < 1

    set_keys = bundles.keys

    set_keys.each do |set_key|
      count = quantity / set_key

      # nothing found
      return nil if count == 0

      # check next if set_key if set_key > count
      # and we have not reached the max value
      next if count > set_key && set_keys.max != set_key
      return { set_key: set_key, count: count, amount: (count * bundles[set_key]) }
    end
  end

  def code
    # raise "No Format Code for this class"
    "VID"
  end

  def bundles
    # raise "No Format Bundle for this class"
    {
      3 => 570,
      5 => 900,
      9 => 1530,
    }
  end
end
