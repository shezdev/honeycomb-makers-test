module Promotion

  def expDeliveryDownTo15(items)
    expressMaterials = items.count { |broadcaster, delivery| delivery.name == :express}
    if expressMaterials >= 2
      discount1 = (expressMaterials * 5)
    else
      discount1 = 0
    end
  end

  def over30get10Off(items)
    sum = items.inject(0) { |memo, (broadcaster, delivery)| memo += delivery.price }
    if sum > 31.0
      discount2 = (sum / 100) * 10
    else
      discount2 = 0
    end
  end


end
