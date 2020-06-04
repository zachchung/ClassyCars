module ApplicationHelper
  def day_of_week(day)
    day_week = ""
    day_week = Date::DAYNAMES[Date.parse(day).wday] if day.is_a? String
    day_week = Date::DAYNAMES[day.wday] if day.is_a? Date
    day_week = Date::DAYNAMES[day % 7] if day.is_a? Integer
    day_week
  end

  def formatted_date(day)
    "#{day_of_week(day)}, #{day}"
  end
end
