module ItemsHelper

  def date_customizer(date)
    return "Today" if date == Date.today.strftime("%m/%d/%Y")
    return "Yesterday" if date == Date.yesterday.strftime("%m/%d/%Y")
    return date
  end
end

