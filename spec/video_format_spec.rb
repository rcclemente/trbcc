require_relative "../lib/video_format.rb"

describe VideoFormat do
  subject{ VideoFormat.new 13 }

  before do
    subject.check_brand_orders
  end

  describe '.orders' do
    it "is not empty" do
      orders = [
        {:amount=>1800, :count=>2, :price=>900, :set_key=>5},
        {:amount=>570, :count=>1, :price=>570, :set_key=>3}
      ]

      subject.orders.should == orders
    end
  end

  describe '.print_order' do
    it 'prints the orders' do
      output = "13 VID $2370\n    2 x 5 $1800\n    1 x 3 $570\n"

      expect do
        subject.print_order
        end.to output(output).to_stdout
      end
  end
end
