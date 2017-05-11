require "Order"

describe "Order" do
  subject(:order) { described_class.new }
  let(:material) { Material.new 'WNP/SWCL001/010' }
  let(:broadcaster_1) { Broadcaster.new 1, 'Viacom' }
  let(:broadcaster_2) { Broadcaster.new 2, 'Disney' }
  let(:broadcaster_3) { Broadcaster.new 3, 'Discovery' }
  let (:standard_delivery) {Delivery.new :standard, 10}
  let (:express_delivery) {Delivery.new :express, 20.0}

  describe "#initialize" do
    context "when created" do
      it "has an advertising material object" do
        order = Order.new(material)
        expect { (order.material.identifier).to eq('WNP/SWCL001/010') }
      end
      it "has an empty items array" do
        order = Order.new(material)
        expect(order.items).to eq([])
      end
    end
  end

  describe "#add" do
    context "for the current order" do
      it "adds the broadcaster and delivery method to an items list" do
        order = Order.new(material)
        broadcaster_A = "A"
        delivery_B = "B"
        order.add(broadcaster_A, delivery_B)
        expect(order.items).to eq([["A", "B"]])
      end
    end
  end

  describe "#getSubtotal" do
    context "returns the total cost of items before any discounts" do

      it "should be empty when there are no items" do
        order = Order.new(material)
        expect(order.getSubtotal).to eq(0)
      end

      it "should get the sub total from the items list" do
        order = Order.new(material)
        order.add(broadcaster_1, standard_delivery)
        order.add(broadcaster_2, standard_delivery)
        expect(order.getSubtotal).to eq(20)
      end
    end
  end

  describe "#print_output" do
    context "returns order output from Printer module" do
      it "prints the order" do
        order = Order.new(material)
        items = [[broadcaster_3, express_delivery]]
        subtotal = 20.0
        material_id = 'WNP/SWCL001/010'
        expect(order.print_output).to be_a(String)
      end
    end
  end

  describe "#checkPromotion" do
    context "Send 2 or more materials via express delivery and the price for express delivery drops to $15" do
      it "update the total cost with discount applied from $40 to $30" do
        order = Order.new(material)
        order.add broadcaster_2, express_delivery
        order.add broadcaster_3, express_delivery
        expect(order.checkPromotion).to eq(30.0)
      end
    end
  end

  describe "#addDiscount" do
    context "Adds a discount to order if applicable" do
      it "updates the total" do
        order = Order.new(material)
        order.add broadcaster_2, express_delivery
        order.add broadcaster_3, express_delivery
        discount = 10.0
        expect(order.addDiscount(discount)).to eq(30.0)
      end
    end
  end


end
