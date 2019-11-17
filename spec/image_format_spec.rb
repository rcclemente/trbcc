require_relative "../lib/image_format.rb"

describe ImageFormat do
  subject{ ImageFormat.new 10 }

  before do
    subject.check_brand_orders
  end

  describe '.orders' do
    it "is not empty" do
      orders = [{:amount=>800, :count=>1, :price=>800, :set_key=>10}]

      subject.orders.should == orders
    end
  end

  describe '.print_order' do
    it 'prints the orders' do
      output = "10 IMG $800\n    1 x 10 $800\n"

      expect do
        subject.print_order
        end.to output(output).to_stdout
      end
  end
end
