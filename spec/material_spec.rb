require "./lib/Material"

describe Material do
  subject(:material) {described_class.new}

  describe "#initialize" do
    context "when created" do
      it "has a clock number id" do
        material = Material.new('WNP/SWCL001/010')
        expect { (material.identifier).to eq('WNP/SWCL001/010') }
      end
    end
  end

end
