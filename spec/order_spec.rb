require "Order"

describe "Order" do
  subject(:order) {described_class.new}
  let(:material) { Material.new 'WNP/SWCL001/010' }

  describe "#initialize" do
    context "when created" do
      it "has an advertising material object" do
        order = Order.new(material)
        expect {(order.material.identifier).to eq('WNP/SWCL001/010')}
      end
    end
  end


end
