require "date"

module CalendarHelper

  def calendar(options = {}, calendar_type = :month, time_zone = "UTC")
    raise(ArgumentError, "No year given")  unless options.has_key?(:year)
    raise(ArgumentError, "No month given") unless options.has_key?(:month)
    
    month_names = Date::MONTHNAMES.dup.delete_if { |month| month.nil? } 

    defaults = {
      :table_class => "calendar",
      :table_id => "calendar_#{options[:year]}_#{options[:month]}",
      :first_day_of_the_week => 0, # sunday
      :highlight_today => true,
      :calendar_title => month_names[options[:month]] 
    }

    options = defaults.merge options

    day_names = days_of_the_week(options[:first_day_of_the_week]) 
    days_of_the_week_indices = (0..6).to_a


    first_day_of_month = Date.civil(options[:year], options[:month], 1)
    last_day_of_month = Date.civil(options[:year], options[:month], -1)
    days_in_the_month = last_day_of_month.day
    number_of_rows_in_calendar_month = get_num_rows_in_month(options[:month], 
      options[:year], options[:first_day_of_the_week])
    offset_of_first_day_of_month = get_difference_of_days(options[:first_day_of_the_week], first_day_of_month.wday)

    calendar_days_array = build_calendar_days_array(options[:month], options[:year], number_of_rows_in_calendar_month,
      offset_of_first_day_of_month)
    current_day = DateTime.now.in_time_zone(time_zone).mday

    cal = "<h1 class='title'>#{options[:calendar_title]}</h1>"
    cal << "<table id='#{options[:table_id]}' class='#{options[:table_class]}'>"
    cal << "<tbody>"
    cal << "<tr>"
    day_names.each do |name|
      cal << "<th>#{name}</th>"
    end
    cal << "</tr>"

    calendar_days_array.each_with_index do |day, index|
      cal << "<tr>" if day.wday == options[:first_day_of_the_week]
      day.mday == current_day ? cal << "<td id='y_#{day.year}_m_#{day.month}_d_#{day.mday}'><div class='today'>" : 
        cal << "<td id='y_#{day.year}_m_#{day.month}_d_#{day.mday}'><div>"
      cal << "#{day.mday}</div></td>"
      cal << "</tr>" if day.wday == last_day_of_the_week(options[:first_day_of_the_week])
    end

    cal << "</tbody></table>" 


  end

  def build_calendar_days_array(month, year, num_rows, offset_of_first_day)
    days_array = []
    days_in_the_month = Date.new(year, month, -1).mday
    num_days_in_calendar_month = num_rows * 7
    days_in_next_month = (num_rows * 7) - days_in_the_month - offset_of_first_day
    offset_of_first_day.downto(1) do |i|
      days_array.push(Date.new(year, month, 1) - i)
    end
    1.upto(days_in_the_month) do |i|
      days_array.push(Date.new(year, month, i))
    end
    1.upto(days_in_next_month) do |i|
      days_array.push(Date.new(year, month, -1) + i)
    end
    puts days_array
    days_array
  end

  def days_of_the_week(first_day_of_week_index)
    days = Date::DAYNAMES
    ordered_days = []
    7.times do |i|
      ordered_days.push(days[first_day_of_week_index + i - 7])
    end
    ordered_days
  end

  def last_day_of_the_week(day)
    day > 0 ? (day - 1) : 6 
  end

  def weekend?(date)
    [0, 6].include?(date.wday) 
  end 

  def get_num_rows_in_month(month, year, first_day_of_week_index)
    first_day_of_month = Date.civil(year, month, 1) 
    days_in_the_month = Date.civil(year, month, -1).mday
    offset = get_difference_of_days(first_day_of_week_index, first_day_of_month.wday)
    weeks = ((offset + days_in_the_month.to_f) / 7).ceil
  end

  def get_difference_of_days(first, second)
    if first > second
      second + (7 - first) 
    else
      second - first 
    end
  end

  # class Engine < Rails::Engine # :nodoc:
  #   ActiveSupport.on_load(:action_view) do
  #     include CalendarHelper
  #   end
  # end if defined? Rails::Engine

end