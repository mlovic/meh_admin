class Teacher < ActiveRecord::Base
  has_many :groups
  
  validates :color, uniqueness: true
  validates :name, uniqueness: true, presence: true

  def hours_per_week
    groups.map(&:hours_per_week).inject(:+)
  end

end
