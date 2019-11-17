require_relative "../lib/format.rb"

describe Format do
  describe 'created class with no arguments' do
    subject{ Format.new }

    describe '.empty?' do
      it "returns true" do
        expect(subject.empty?).to be_truthy
      end
    end

    describe '.orders' do
      it "is empty" do
        subject.orders.should == []
      end
    end

    describe '.bundles' do
      it "raises" do
        expect { subject.bundles }.to raise_error(Format::MethodNotImlemented)
      end
    end

    describe '.code' do
      it "raises" do
        expect { subject.bundles }.to raise_error(Format::MethodNotImlemented)
      end
    end

    describe '.print_order' do
      it 'prints nothing' do
        expect do
          subject.print_order
        end.to output('').to_stdout
      end
    end
  end

  describe 'created class with valid arguments' do
    subject{ Format.new 9 }

    before do
      subject.stub(:bundles) { { 3 => 100 } }
      subject.stub(:code) { 'MPG' }
    end

    describe '.check_brand_orders' do
      it 'will set the orders with SubsetSum' do
        expect(SubsetSum).to receive(:subset_sum).with( [3], 9 )

        subject.check_brand_orders
      end

      it 'will set the orders with find_order_for_quantity' do
        allow(SubsetSum).to receive(:subset_sum).and_return( nil )
        expect(subject).to receive(:find_order_for_quantity)

        subject.check_brand_orders
      end
    end

    before do
      subject.check_brand_orders
    end

    describe '.print_order' do
      it 'prints nothing' do
        output = "9 MPG $300\n    3 x 3 $300\n"
        expect do
          subject.print_order
        end.to output(output).to_stdout
      end
    end

    describe '.empty?' do
      it "returns false" do
        expect(subject.empty?).to be_falsey
      end
    end

    describe '.empty?' do
      it "returns false" do
        expect(subject.empty?).to be_falsey
      end
    end
  end

  # ClassMethod
  describe '#get_brand_orders' do
    it 'checks the brand orders' do
      Format.any_instance.stub(:bundles).and_return({ 5 => 100 })
      Format.any_instance.stub(:code).and_return('MPG')

      expect_any_instance_of(Format).to receive(:find_order_for_quantity)

      subject = Format.get_brand_orders 10
    end
  end
end
