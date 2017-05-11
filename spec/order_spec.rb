require "Order"

describe "Order" do
  subject(:order) { described_class.new }
  let(:material) { Material.new 'WNP/SWCL001/010' }
  let(:broadcaster_1) { Broadcaster.new 1, 'Viacom' }
  let(:broadcaster_2) { Broadcaster.new 2, 'Disney' }
  let (:standard_delivery) {Delivery.new :standard, 10.0}

  describe "#initialize" do
    context "when created" do
      it "has an advertising material object" do
        order = Order.new(material)
        expect { (order.material.identifier).to eq('WNP/SWCL001/010') }
      end
      it "has an empty items array" do
        order = Order.new(material)
        expect { (order.items).should be_empty }
      end
    end
  end

  describe "#add" do
    context "for the current order" do
      it "adds the broadcaster and delivery method to an items list" do
        order = Order.new(material)
        broadcaster_A = "A"
        delivery_B = "B"
        items = []
        order.add(broadcaster_A, delivery_B)
        expect { (items).to eq("A", "B") }
      end
    end
  end

  describe "#getSubtotal" do
    context "returns the total cost of items before any discounts" do
      it "should get the sub total from the items list" do
        order = Order.new(material)
        order.add(broadcaster_1, standard_delivery)
        order.add(broadcaster_2, standard_delivery)
        expect { (order.subtotal).to eq(20) }
      end
    end
  end

end
