require 'rspec'
require 'readline'
require_relative 'lib/format'

task :get_brand_orders do

  # Store the state of the terminal
  stty_save = `stty -g`.chomp

  begin
    while orders = Readline.readline('> ', true).scan(/((\d+) +(FLAC|IMG|VID))/)
      # p line

      ruby -r "./format.rb" -e "Format.test"
    end

    puts "done"
  rescue Interrupt => e
    system('stty', stty_save) # Restore
    exit
  end
end

task default: :get_brand_orders
