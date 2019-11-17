require_relative "../lib/audio_format.rb"

describe AudionFormat do
  subject{ AudionFormat.new 15 }

  before do
    subject.check_brand_orders
  end

  describe '.orders' do
    it "is not empty" do
      orders = [
        {:set_key=>6, :count=>1, :price=>810, :amount=>810},
        {:set_key=>9, :count=>1, :price=>1147.5, :amount=>1147.5}
      ]

      subject.orders.should == orders
    end
  end

  describe '.print_order' do
    it 'prints the orders' do
      output = "15 FLAC $1957.5\n    1 x 6 $810\n    1 x 9 $1147.5\n"

      expect do
        subject.print_order
        end.to output(output).to_stdout
      end
  end
end
