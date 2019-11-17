require_relative 'subset_sum'

class Format
  # def self.test(value = 10)
  #   o = Format.new value
  #   o.check_brand_orders
  #   # puts o.orders
  #   puts o.print_order
  # end

  class MethodNotImlemented < StandardError; end

  def self.get_brand_orders(quantity)
    o = self.new quantity
    o.check_brand_orders
    o
  end

  def initialize(quantity = 0)
    @quantity = (quantity.to_i > 0) ? quantity.to_i : 0
  end

  def check_brand_orders
    return [] if @quantity < 1

    set_keys = SubsetSum.subset_sum bundles.keys, @quantity

    if !set_keys.nil?
      set_keys.each do |set_key|
        orders << get_order(1, set_key)
      end
    else
      quantity = @quantity
      loop do
        order = find_order_for_quantity quantity
        break unless order

        # check if there is a remaining value to evaluate
        quantity = quantity % order[:set_key]

        orders << order
      end
    end
  end

  def find_order_for_quantity(quantity)
    return nil if quantity < 1

    set_keys = bundles.keys
    max_set_key = set_keys.max

    set_keys.each do |set_key|
      count = quantity / set_key

      # nothing found
      return nil if count == 0

      # check next if set_key > count
      # and we have not reached the max value
      next if count > set_key && max_set_key != set_key

      return get_order(count, set_key)
    end
  end

  def get_order(count, set_key)
     { set_key: set_key, count: count, price: bundles[set_key], amount: (count * bundles[set_key]) }
  end

  def orders
    @orders ||= []
  end

  def empty?
    orders.empty?
  end

  def print_order
    return if orders.empty?

    puts "#{@quantity} #{code} $#{ orders.sum {|o| o[:amount]} }"
    orders.each do |order|
      puts "    #{order[:count]} x #{order[:set_key]} $#{order[:amount]}"
    end
  end

  def code
    raise MethodNotImlemented
    # "IMG"
  end

  def bundles
    raise MethodNotImlemented
    # {
    #   5 => 480,
    #   10 => 800
    # }
  end
end
