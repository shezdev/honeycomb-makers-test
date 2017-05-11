require "Promotion"

describe "Promotion" do

  describe "Promotion module" do
    let(:order) { Class.new { include Promotion } }
    # let(:broadcaster_1) { Broadcaster.new 1, 'Viacom' }
    # let(:broadcaster_2) { Broadcaster.new 2, 'Disney' }
    # let(:broadcaster_3) { Broadcaster.new 3, 'Discovery' }
    # let (:standard_delivery) {Delivery.new :standard, 10.0}
    # let (:express_delivery) {Delivery.new :express, 20.0}
    let (:material) { Material.new 'WNP/SWCL001/010'}

    describe "#expDeliveryDownTo15" do
      context "when invoked" do
        it "receives the items from the order" do
          test_order = order.new
          expect(test_order).to respond_to(:expDeliveryDownTo15).with(1).argument
        end
        it "checks and calculates discount on order" do
          test_order = order.new
          express_delivery = Delivery.new(:express, 20.0)
          broadcaster_1 = Broadcaster.new(1, 'Viacom')
          broadcaster_2 = Broadcaster.new(2, 'Disney')
          items = [[broadcaster_1, express_delivery],[broadcaster_2, express_delivery]]
          expect(test_order.expDeliveryDownTo15(items)).to eq(10)
        end
      end
    end

    describe "#over30get10Off" do
      context "when invoked" do
        it "receives the items from the order" do
          test_order = order.new
          expect(test_order).to respond_to(:over30get10Off).with(1).argument
        end
        it "checks and calculates discount on order" do
          test_order = order.new
          express_delivery = Delivery.new(:express, 20.0)
          standard_delivery = Delivery.new(:standard, 10.0)
          broadcaster_1 = Broadcaster.new(1, 'Viacom')
          broadcaster_2 = Broadcaster.new(2, 'Disney')
          broadcaster_3 = Broadcaster.new(3, 'Discovery')
          broadcaster_4 = Broadcaster.new(4, 'ITV')
          items = [[broadcaster_1, express_delivery],[broadcaster_2, standard_delivery],[broadcaster_3, standard_delivery],[broadcaster_4, standard_delivery]]
          expect(test_order.expDeliveryDownTo15(items)).to eq(45)
        end
      end

    end


  end
end
