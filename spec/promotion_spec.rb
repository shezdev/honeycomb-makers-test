describe "Promotion" do

  describe "Promotion module" do
    let(:order) { Class.new { include Promotion } }
    let(:broadcaster_1) { Broadcaster.new 1, 'Viacom' }
    let(:broadcaster_2) { Broadcaster.new 2, 'Disney' }
    let(:broadcaster_3) { Broadcaster.new 3, 'Discovery' }
    let (:standard_delivery) {Delivery.new :standard, 10.0}
    let (:express_delivery) {Delivery.new :express, 20.0}
    let (:material) { Material.new 'WNP/SWCL001/010'}

    describe "#expDeliveryDownTo15" do
      context "when invoked" do
        it "checks and applies discount to order" do
        order1 = order.new(material)
        order1.add(broadcaster_1, express_delivery)
        order1.add(broadcaster_3, express_delivery)
        order.checkPromotion
        expect(order.getTotalCost).to eq(30)
        end
      end
    end


  end
end
