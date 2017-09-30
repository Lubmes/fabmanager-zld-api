class ReturningActivity < ApplicationRecord
  belongs_to :weekly_time_table
  
  enum day: { sunday: 1,
              monday: 2, tuesday: 3, wednesday: 4, thursday: 5, friday: 6,
              saterday: 7 }
end
