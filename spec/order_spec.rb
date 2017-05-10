require "Order"

describe "Order" do
  subject(:order) { described_class.new }
  let(:material) { Material.new 'WNP/SWCL001/010' }
  let(:broadcaster_1) { Broadcaster.new 1, 'Viacom' }
  let (:standard_delivery) {Delivery.new :standard, 10.0}

  describe "#initialize" do
    context "when created" do
      it "has an advertising material object" do
        order = Order.new(material)
        expect {(order.material.identifier).to eq('WNP/SWCL001/010')}
      end
    end
  end

  describe "#add" do
    context "for the current order" do
      it "adds the broadcaster and delivery method to an items list" do
        order = Order.new(material)
        list = []
        order.add(broadcaster_1, standard_delivery)
        expect(list).not_to be.empty
      end
    end
  end

end
