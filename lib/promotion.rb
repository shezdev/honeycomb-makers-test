module Promotion

  def expDeliveryDownTo15(items)
    expressMaterials = items.count { |broadcaster, delivery| delivery.name == :express}
    if expressMaterials >= 2
      discount1 = (expressMaterials * 5.0)
    else
      discount1 = 0
    end
  end

  def over30get10Off(total)
    if (total > 31.0)
      discount2 = total * 0.1
    else
      discount2 = 0
    end
  end


end
