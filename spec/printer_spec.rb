require "Printer"

describe "Printer module" do
  let(:order) { Class.new { include Printer } }
  let(:broadcaster_3) { Broadcaster.new 3, 'Discovery' }
  let (:express_delivery) {Delivery.new :express, 20}
   describe "#output" do
    context "when invoked" do
      it "takes the items in the order and the order subtotal" do
        test_order = order.new
        expect(test_order).to respond_to(:output).with(5).argument
      end

      it "prints an order" do
        test_order = order.new
        express_delivery = Delivery.new(:express, 20.0)
        standard_delivery = Delivery.new(:standard, 10.0)
        broadcaster_1 = Broadcaster.new(1, 'Viacom')
        broadcaster_2 = Broadcaster.new(2, 'Disney')
        broadcaster_3 = Broadcaster.new(3, 'Discovery')
        broadcaster_4 = Broadcaster.new(4, 'ITV')
        items = [[broadcaster_1, express_delivery],[broadcaster_2, standard_delivery],[broadcaster_3, standard_delivery],[broadcaster_4, standard_delivery]]
        subtotal = 50.0
        discounts = 5.0
        total = 45.0
        material_id = 'WNP/SWCL001/010'
        discounts =
        # result = "Order for WNP/SWCL001/010:\nbroadcaster          | delivery | price   \n-------------------- | -------- | --------\nDiscovery            | express  | $20     \n-------------------- | -------- | --------\nSubtotal: $20.0"
        expect(test_order.output(items, subtotal, material_id, discounts, total)).to be_a(String)
      end

    end
  end


end
