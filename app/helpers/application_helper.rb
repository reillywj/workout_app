module ApplicationHelper

  def convert_date(date)
    date.strftime("%b %-d, %Y")
  end
end
