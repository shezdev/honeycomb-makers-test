require_relative 'printer'

class Order
  include Printer

  attr_accessor :material, :items

  def initialize(material)
    self.material = material
    self.items = []
  end

  def add(broadcaster, delivery)
    items << [broadcaster, delivery]
  end

  def getSubtotal
    subtotal = items.inject(0) { |memo, (_, delivery)| memo += delivery.price }
  end

end
