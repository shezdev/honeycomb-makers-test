module Promotion

  def expDeliveryDownTo15(items)
    print items
    expressMaterials = items.count { |broadcaster, delivery| delivery.name == :express}
    if expressMaterials >= 2
      discount = (expressMaterials * 5)
    else
      discount = 0
    end
  end

end
