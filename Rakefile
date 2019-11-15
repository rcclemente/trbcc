require 'rspec'
require 'readline'
require_relative 'lib/format'

task :get_brand_orders do

  # Store the state of the terminal
  stty_save = `stty -g`.chomp

  begin
    orders = Readline.readline('> ', true).scan(/((\d+) +(FLAC|IMG|VID))/)

    if orders.empty?
      p "No orders found"
      exit
    end

    # while
    #   p orders
    #   # ruby -r "./format.rb" -e "Format.test"
    # end

    puts "done"
  rescue Interrupt => e
    system('stty', stty_save) # Restore
    exit
  end
end

task default: :get_brand_orders
