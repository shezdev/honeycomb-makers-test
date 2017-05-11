require "Printer"

describe "Printer module" do
  let(:order) { Class.new { include Printer } }

  describe "#output" do
    context "when invoked" do
      it "takes the items in the order and the order subtotal" do
        test_order = order.new
        expect(test_order).to respond_to(:output).with(2).argument
      end

      it "prints an order" do
        test_order = order.new
        items = ["Discovery", "express", 10.0]
        subtotal = 10.0
        expect(test_order.output(items, subtotal)).to eq(
        "Order for WNP/SWCL001/010:
        broadcaster          | delivery | price
        -------------------- | -------- | --------
        Discovery            | express  | $10.0
        -------------------- | -------- | --------
        Subtotal: $10.0")
        expect(test_order.output(items, subtotal)).to eq(
        "Order for WNP/SWCL001/010:
        broadcaster          | delivery | price
        -------------------- | -------- | --------
        Discovery            | express  | $10.0
        -------------------- | -------- | --------
        Subtotal: $10.0")
      end





    end
  end


end
