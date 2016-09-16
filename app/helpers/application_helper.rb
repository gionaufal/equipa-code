module ApplicationHelper
  def friendly_date(date)
    I18n.l(date, format: '%d de %B de %Y' )
  end
end
