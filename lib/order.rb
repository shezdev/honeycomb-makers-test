require_relative 'printer'
require_relative 'promotion'

class Order
  include Printer
  include Promotion
  
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

  def print_output
    output(items, getSubtotal, material.identifier)
  end

end
