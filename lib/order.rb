require_relative 'promotion'
require_relative 'printer'

class Order
  include Promotion
  include Printer

  attr_accessor :material, :items, :total

  def initialize(material)
    self.material = material
    self.items = []
    self.total = 0
  end

  def add(broadcaster, delivery)
    items << [broadcaster, delivery]
  end

  def getSubtotal
    subtotal = items.inject(0) { |memo, (_, delivery)| memo += delivery.price }
  end

  def print_output
    output(items, getSubtotal, material.identifier)
  end

  def checkPromotion
    promotion1 = expDeliveryDownTo15(items)
    if promotion1 > 0
      addDiscount(promotion1)
    end
  end
  
  def addDiscount(discount)
    total = getSubtotal - discount
  end

end
