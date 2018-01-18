module DateHelper

  def format_date(date)
     date.strftime("%a") + ", " + date.to_formatted_s(:rfc822)
  end

end