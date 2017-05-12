require "./lib/Broadcaster"

describe Broadcaster do
  subject(:broadcaster) { described_class.new}

  describe "#initialize" do
    context "when created" do
      it "has an ID and a name" do
        broadcaster_1 = Broadcaster.new(1, 'Viacom')
        expect { (broadcaster_1.id).to eq(1) }
        expect { (broadcaster_1.name).to eq('viacom') }
      end
    end
  end

end
