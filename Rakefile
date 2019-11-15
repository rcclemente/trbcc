require 'rspec'
require 'readline'
# require_relative 'lib/format'
Dir["lib/*.rb"].each {|file| require_relative file }

task :get_brand_orders do

  # Store the state of the terminal
  stty_save = `stty -g`.chomp

  # ruby -r "./format.rb" -e "Format.test"
  begin
    orders = Readline.readline('> ', true).scan(/((\d+) +(FLAC|IMG|VID))/)

    if orders.empty?
      p "No orders found"
      exit
    end

    orders.each do |order|
      quantity, format = order[1], order[2]
      format_orders = case format
                      when 'FLAC'
                        AudionFormat.new quantity
                      when 'IMG'
                        ImageFormat.new quantity
                      when 'VID'
                        VideoFormat.new quantity
                      end

      format_orders.check_brand_orders

      unless format_orders.empty?
        format_orders.print_order
      end
    end

    puts "done"
  rescue Interrupt => e
    system('stty', stty_save) # Restore
    exit
  end
end

task default: :get_brand_orders
