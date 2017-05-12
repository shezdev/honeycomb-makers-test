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
  end

  def add(broadcaster, delivery)
    items << [broadcaster, delivery]
  end

  def getSubtotal
    subtotal = items.inject(0) { |memo, (_, delivery)| memo += delivery.price }
  end

  def checkPromotion
    @total = getSubtotal
    if (promotion1 = expDeliveryDownTo15(items)) > 0
      addDiscount(promotion1)
    end
    if (promotion2 = over30get10Off(@total))
      addDiscount(promotion2)
    end
    @discounts = promotion1 + promotion2
  end

  def addDiscount(current_discount)
    @total = @total - current_discount
  end

  def print_output
    output(items, getSubtotal, material.identifier, @discounts, @total)
  end

end
