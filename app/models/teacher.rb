class Teacher < ActiveRecord::Base
  has_many :groups
  
  validates :color, uniqueness: true, numericality: false
  validates :name, uniqueness: true, presence: true, numericality: false

  def hours_per_week
    groups.map(&:hours_per_week).inject(:+)
  end

  # TODO how to dry up. Groups enumerator?
  def classes_between(*args)
    groups.flat_map { |g| g.classes_between(*args) }
  end
end
