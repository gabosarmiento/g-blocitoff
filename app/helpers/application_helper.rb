module ApplicationHelper
  def control_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'control-group error'
    else
      content_tag :div, capture(&block), class: 'control-group'
    end
  end

  def time_left(todo)
    end_date = todo.created_at + 7.days
    if end_date < Time.now # ended already
        return 'Ended'
      elsif end_date > (Time.now + 1.day) # more than 1 day away
        diff_in_days = ((end_date - Time.now).to_i / 1.day)
        days_string = diff_in_days.to_s
        days_string += (diff_in_days > 1) ? ' Days' : ' Day'
      return days_string
      else # ending today
        diff_in_HMS = Time.at(end_date - Time.now).gmtime.strftime('%R:%S')
      return diff_in_HMS
    end
  end
end
