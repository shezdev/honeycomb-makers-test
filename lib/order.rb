require_relative 'promotion'
require_relative 'printer'

class Order
  include Promotion
  include Printer

  attr_accessor :material, :items, :total, :discounts

  def initialize(material)
    self.material = material
    self.items = []
    @total = 0
    @discounts = 0
    @d = []
  end

  def add(broadcaster, delivery)
    items << [broadcaster, delivery]
  end

  def getSubtotal
    subtotal = items.inject(0) { |memo, (_, delivery)| memo += delivery.price }
  end

  def checkPromotion
    promotion1 = expDeliveryDownTo15(items)
    promotion2 = over30get10Off(items)
    @discounts = promotion1 + promotion2
    if @discounts > 0
      addDiscount(@discounts)
    end
  end

  def addDiscount(current_discounts)
    @total = getSubtotal - current_discounts
  end

  def print_output
    print "total is #{@total}"
    output(items, getSubtotal, material.identifier, @discounts, @total)
  end

end
