require 'date' # necessary?
require 'pp'

class WeeklyClass < ActiveRecord::Base
  include IceCube
  belongs_to :group

    #scope :before, lambda {|end_time| {:conditions => ["ends_at < ?", Event.format_date(end_time)] }}
    #scope :after, lambda {|start_time| {:conditions => ["starts_at > ?", Event.format_date(start_time)] }}
    
    # need to override the json view to return what full_calendar is expecting.
    # http://arshaw.com/fullcalendar/docs/event_data/Event_Object/

  def abs_start_time
    #now = DateTime.new
    p starts_at.class
    p starts_at
    seconds_in = starts_at.seconds_since_midnight.to_i
    p seconds_in

    monday_time = Date.today.beginning_of_week(:monday).to_time + seconds_in

    start = Schedule.new(monday_time)
    start.add_recurrence_rule Rule.weekly.day(day_of_week)
    start.next_occurrence
    # right now no use using ice_cube. But maybe give group a sched instead 
  end

  def abs_end_time
    p ends_at.class
    p ends_at
    seconds_in = ends_at.seconds_since_midnight.to_i
    p seconds_in

    monday_time = Date.today.beginning_of_week(:monday).to_time + seconds_in

    final = Schedule.new(monday_time)
    final.add_recurrence_rule Rule.weekly.day(day_of_week)
    final.next_occurrence
  end

  def as_json(options = {})
    #start_time = next_date + t.seconds_since_midnight.seconds  
    # TODO serialize ice_cube
    now = DateTime.new
    seconds_in = starts_at.seconds_since_midnight
    #monday = DateTime.new(Date.today.beginning_of_week(:monday))
    monday = Date.today.beginning_of_week(:monday).to_datetime
    day = monday.wday = day_of_week
    class_time = day + seconds_in
    day monday 
    
    monday

    #today = starts_at.change {year: now.year, month: now.month, day: now.day}
    monday = starts_at - now.wday 

    pp starts_at.time

    start = Schedule.new(starts_at)
    start.add_recurrence_rule Rule.weekly.day(day_of_week)
    pp start
    final = Schedule.new(ends_at)
    final.add_recurrence_rule Rule.weekly.day(day_of_week)
      
    {
      :id => self.id,
      :title => group.level + ' ' + self.id.to_s, # self.title,
      :description => "desc here", #self.description || "",
      :start => start.next_occurrence(get_monday).rfc822,
      :end => final.next_occurrence(get_monday).rfc822,
      :allDay => false,
      :recurring => false, #change here
      :color => group.teacher.color # cache this somehow?
      #:url => Rails.application.routes.url_helpers.event_path(id)
    }
    
  end
    
  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end

  private 
    def get_monday
      sched = Schedule.new(Time.new('00:00:00')) do |s|
                s.add_recurrence_rule Rule.weekly.day(:monday)
              end
      pp sched
      sched.previous_occurrence(Time.now)
    end
    
    def next_date(day)
      date  = Date.parse(day)
      delta = date > Date.today ? 0 : 7
      date + delta
    end
end
