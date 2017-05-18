require "date"

module Promotion

  def expDeliveryDownTo15(items)
    expressMaterials = items.count { |broadcaster, delivery| delivery.name == :express}
    if expressMaterials >= 2
      discount1 = (expressMaterials * 5.0)
    else
      discount1 = 0
    end
  end

  def july_over_30_get_20_off(total)
    if ((Date.today.month == 7) && total > 30.0)
      discount3 = total * 0.2
    else
      over30get10Off(total)
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
