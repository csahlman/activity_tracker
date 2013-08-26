require "date"

module CalendarHelper

  def calendar_month(options = {})
    raise(ArgumentError, "No year given")  unless options.has_key?(:year)
    raise(ArgumentError, "No month given") unless options.has_key?(:month)
    
    days_of_the_week = Date::DAYNAMES.dup
    days_of_the_week_indices = (0..6).to_a
    month_names = Date::MONTHNAMES.dup.delete_if { |month| month.nil? } 

    defaults = {
      :table_class => "calendar",
      :table_id => "calendar_#{options[:year]}_#{options[:month]}",
      :first_day_of_the_week => 0, # sunday
      :highlight_today => true,
      :calendar_title => month_names[options[:month]] 
    }

    options = default.merge options

    first_day_of_month = Date.civil(options[:year], options[:day], 1)
    last_day_of_month = Date.civil(options[:year], options[:day], -1)
    days_in_the_month = last_day_of_month.day  


  end

  def last_day_of_the_week(day)
    day > 0 ? (day - 1) : 6 
  end

  def weekend?(date)
    [0, 6].include?(date.wday) 
  end 

end