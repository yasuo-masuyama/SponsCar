module ApplicationHelper
  def converting_to_jpy(amounts)
    "#{amounts.to_s(:delimited, delimiter: ',')}円"
  end
end
