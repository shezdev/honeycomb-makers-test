require "Delivery"

describe Delivery do
  subject(:delivery) {described_class.new}

  describe "#initialize" do
    context "when created" do
      it "has a name and a price" do
        standard_delivery = Delivery.new(:standard, 10.0)
        expect { (standard_delivery.name).to eq(:standard) }
        expect { (standard_delivery.price).to eq(10.0) }
      end
    end
  end

end
