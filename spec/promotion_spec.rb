require "Promotion"

describe "Promotion" do

  describe "Promotion module" do
    let (:material) { Material.new 'WNP/SWCL001/010'}
    let(:order) { Order.new(material) { include Promotion } }
    let(:broadcaster_1) { Broadcaster.new 1, 'Viacom' }
    let(:broadcaster_2) { Broadcaster.new 2, 'Disney' }
    let(:broadcaster_3) { Broadcaster.new 3, 'Discovery' }
    let (:standard_delivery) {Delivery.new :standard, 10.0}
    let (:express_delivery) {Delivery.new :express, 20.0}

    describe "#expDeliveryDownTo15" do
      context "when invoked" do
        it "checks and calculates discount on order" do
        # order1 = order.new(material)
        order.add(broadcaster_1, express_delivery)
        order.add(broadcaster_3, express_delivery)
        expect(order.expDeliveryDownTo15(order.items)).to eq(10)
        end
      end
    end


  end
end
