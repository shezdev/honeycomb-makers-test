require "./lib/promotion"
require "./lib/broadcaster"
require "./lib/order"
require "./lib/delivery"
require "./lib/material"
require "timecop"

describe "Promotion" do

  describe "Promotion module" do
    let (:material) { Material.new 'WNP/SWCL001/010'}
    let(:order) { Order.new(material) }

    let(:broadcaster_1) { Broadcaster.new 1, 'Viacom' }
    let(:broadcaster_2) { Broadcaster.new 2, 'Disney' }
    let(:broadcaster_3) { Broadcaster.new 3, 'Discovery' }
    let(:broadcaster_4) { Broadcaster.new 4, 'ITV' }
    let (:standard_delivery) {Delivery.new :standard, 10.0}
    let (:express_delivery) {Delivery.new :express, 20.0}

    describe "#expDeliveryDownTo15" do
      context "when invoked" do
        it "receives the items from the order" do

          expect(order).to respond_to(:expDeliveryDownTo15).with(1).argument
        end
        it "checks and calculates discount on order" do

          items = [[broadcaster_1, express_delivery],[broadcaster_2, express_delivery]]
          expect(order.expDeliveryDownTo15(items)).to eq(10)
        end
      end
    end

    describe "#july_over_30_get_20_off" do

      before do
        t = Time.local(2017, 7, 2)
        Timecop.travel(t)
      end

      it "returns a discount of 20% if total spend is over $30 in July" do
        total = 100
        d = Date.new(2017,7,2)
        expect(Date.today).to eq(d)
        expect(order.july_over_30_get_20_off(total)).to eq(20)
      end


    end

    describe "#over30get10Off" do
      context "when invoked" do
        it "receives the items from the order" do

          expect(order).to respond_to(:over30get10Off).with(1).argument
        end
        it "checks and calculates discount on order" do


          total = 50
          expect(order.over30get10Off(total)).to eq(5.0)
        end
      end
    end

  end
end
