require "date"

module CalendarHelper

  def calendar(options = {}, calendar_type = :month)
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

    cal = "<table id='#{options[:table_id]}' class='#{options[:table_class]}'>"
    cal << "<thead>#{options[:calendar_title]}</thead>"
    cal << "<tbody>"
    number_of_rows_in_calendar_month.times do 
      cal << "<tr>"
      7.times do |i|
        cal << "<td>#{day_names[i]}</td>" 
      end
      cal << "</tr><br>"
    end
    cal << "</tbody></table>" 


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