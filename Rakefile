require 'rspec'
require 'readline'
require_relative 'lib/subset_sum'

# RSpec::Core::RakeTask.new(:spec)


task :get_brand_orders do

  # Store the state of the terminal
  stty_save = `stty -g`.chomp

  begin
    while orders = Readline.readline('> ', true).scan(/((\d+) +(FLAC|IMG|VID))/)
      # p line

    end

    puts "done"
  rescue Interrupt => e
    system('stty', stty_save) # Restore
    exit
  end
end

task default: :get_brand_orders
