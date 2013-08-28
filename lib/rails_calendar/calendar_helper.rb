# require "date"

# module RailsCalendar
#   module CalendarHelper

#     def calendar(options = {year: Date.today.year, month: Date.today.month}, 
#       calendar_type = :month, time_zone = "UTC")
#       # raise(ArgumentError, "No year given")  unless options.has_key?(:year)
#       # raise(ArgumentError, "No month given") unless options.has_key?(:month)

#       Calendar.new(self, options).draw_table(calendar_type) 
#     end

#     class Calendar
#       attr_accessor :view, :month, :year, :first_day_of_the_week, :highlight_today, :today, :date
#       MONTH_NAMES = Date::MONTHNAMES.dup

#       delegate :content_tag, :link_to, to: :view

#       def initialize(view, options = {})
#         @view = view 
#         # @month = options[:month]
#         # @year = options[:year]
#         @today = Date.today
#         @date = Date.new(options[:year], options[:month])
#         @first_day_of_the_week = options[:first_day_of_the_week]
#         @highlight_today = options[:highlight_today]
#         @options = {
#           :month => options[:month],
#           :year => options[:year],
#           :table_class => "calendar",
#           :table_id => "calendar_#{options[:year]}_#{options[:month]}",
#           :first_day_of_the_week => options[:first_day_of_the_week], # sunday
#           :highlight_today => true,
#           :calendar_title => MONTH_NAMES[options[:month]] 
#         }
#       end

#       def draw_table(calendar_type)
#         header = draw_header
#         table = content_tag :table, class: @options[:table_class], id: @options[:table_id] do 
#           content_tag :tbody do 
#             week_rows 
#           end.html_safe
#         end.html_safe
#         header + table
#       end

#     private 

#       def draw_header
#         content_tag :div, class: "calendar_header" do 
#           prev_link = link_to "<<", Rails.application.routes.url_helpers.activities_path(month: @date.prev_month.strftime("%Y%m")), 
#             id: "previous_month", remote: true
#           month_name = content_tag :span, "#{@options[:calendar_title]}", class: 'title'
#           next_link = link_to ">>", Rails.application.routes.url_helpers.activities_path(month: @date.next_month.strftime("%Y%m")), 
#             id: "previous_month", remote: true
#           prev_link + month_name + next_link
#         end.html_safe
#       end

#       def day_labels
#         html = ""
#         content_tag :tr do 
#           days_of_the_week(@options[:first_day_of_the_week]).each do |day|
#             html.concat (content_tag :th, day).html_safe
#           end
#           html.html_safe
#         end.html_safe
#       end

#       def week_rows
#         weeks.map do |week|
#           content_tag :tr do 
#             week.map { |day| day_cell(day) }.join.html_safe
#           end
#         end.join.html_safe
#       end

#       def weeks
#         start_day = days_of_the_week(@first_day_of_the_week)[0].parameterize.underscore.to_sym
#         first = @date.beginning_of_month.beginning_of_week(start_day)
#         last = @date.end_of_month.end_of_week(start_day)
#         (first..last).to_a.in_groups_of(7)
#       end

#       def day_cell(day)
#         content_tag :td do 
#           content_tag :div, day.mday, class: day_classes(day)
#         end.html_safe 
#       end

#       def day_classes(day)
#         day_classes = []
#         day_classes << "current_month" if day.month == @date.month
#         day_classes << "today" if day == Date.today 
#         day_classes.join " "
#       end

#       def days_of_the_week(first_day_of_week_index)
#         days = Date::DAYNAMES
#         ordered_days = []
#         7.times do |i|
#           ordered_days.push(days[first_day_of_week_index + i - 7])
#         end
#         ordered_days
#       end

#       def last_day_of_the_week(day)
#         day > 0 ? (day - 1) : 6 
#       end

#       def weekend?(date)
#         [0, 6].include?(date.wday) 
#       end 

#       def get_difference_of_days(first, second)
#         if first > second
#           second + (7 - first) 
#         else
#           second - first 
#         end
#       end

#     end
#   end

# end