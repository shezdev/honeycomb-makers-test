require_relative 'promotion'
require_relative 'printer'

class Order
  include Promotion
  include Printer

  attr_accessor :material, :items, :total, :discounts

  def initialize(material)
    self.material = material
    self.items = []
    self.total = 0
    self.discounts = 0
  end

  def add(broadcaster, delivery)
    items << [broadcaster, delivery]
  end

  def checkPromotion
    promotion1 = expDeliveryDownTo15(items)
    promotion2 = over30get10Off(items)
    discounts = promotion1 + promotion2
    if discounts > 0
      addDiscount(discounts)
    end
  end

  def addDiscount(discounts)
    total = getSubtotal - discounts
  end

  def getSubtotal
    subtotal = items.inject(0) { |memo, (_, delivery)| memo += delivery.price }
  end

  def print_output
    output(items, getSubtotal, material.identifier, discounts, total)
  end

end
