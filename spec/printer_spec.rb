require "Printer"

describe "Printer module" do
  let(:order) { Class.new { include Printer } }
  let(:broadcaster_3) { Broadcaster.new 3, 'Discovery' }
  let (:express_delivery) {Delivery.new :express, 20}
   describe "#output" do
    context "when invoked" do
      it "takes the items in the order and the order subtotal" do
        test_order = order.new
        expect(test_order).to respond_to(:output).with(3).argument
      end

      it "prints an order" do
        test_order = order.new
        broadcaster_3 = Broadcaster.new(3, 'Discovery')
        # items = ["Discovery", "express", 10.0]
        items = [[broadcaster_3, express_delivery]]
        subtotal = 20.0
        material_id = 'WNP/SWCL001/010'
        result = "Order for WNP/SWCL001/010:\nbroadcaster          | delivery | price   \n-------------------- | -------- | --------\nDiscovery            | express  | $20     \n-------------------- | -------- | --------\nSubtotal: $20.0"
        expect(test_order.output(items, subtotal, material_id)).to eq(result)
      end

    end
  end


end
