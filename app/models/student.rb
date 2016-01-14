class Student < ActiveRecord::Base
  #attr_accessor :group_id
  #
  #TODO split into two: children and adults, using STI
  # what to do about people who are in both kinds of groups, teenagers
  #   probably should be adults. 

  belongs_to :group

  def age
    now = Time.now.utc.to_date
    now.year - date_of_birth.year - (date_of_birth.to_date.change(:year => now.year) > now ? 1 : 0)
  end

end
