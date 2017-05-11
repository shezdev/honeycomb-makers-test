require "Printer"

describe "Printer module" do
  let(:order) { Class.new { include Printer } }

  describe "#output" do
    context "when invoked" do
      it "takes the items in the order and the order subtotal" do
        test_order = order.new
        expect(test_order).to respond_to(:output).with(2).argument
      end
    end
  end


end
