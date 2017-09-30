class WeeklyTimeTable < ApplicationRecord
  belongs_to :control_panel
  has_many :returning_activities
end
