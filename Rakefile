require 'readline'
Dir["lib/*.rb"].each {|file| require_relative file }

begin
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new(:spec)

  # task :default => :spec
rescue LoadError
  # no rspec available
end

task :get_brand_orders do

  # Store the state of the terminal
  stty_save = `stty -g`.chomp

  # ruby -r "./format.rb" -e "Format.test"
  begin
    orders = Readline.readline('Input brand order> ', true).scan(/((\d+) +(FLAC|IMG|VID))/)

    if orders.empty?
      p "No orders found"
      exit
    end

    orders.each do |order|
      quantity, format = order[1], order[2]
      format_orders = case format
                      when 'FLAC'
                        AudionFormat.get_brand_orders quantity
                      when 'IMG'
                        ImageFormat.get_brand_orders quantity
                      when 'VID'
                        VideoFormat.get_brand_orders quantity
                      end

      format_orders.print_order unless format_orders.empty?
    end

    puts "done"
  rescue Interrupt => e
    system('stty', stty_save) # Restore
    exit
  end
end

task default: :get_brand_orders
