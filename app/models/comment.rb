class Comment < ApplicationRecord
  belongs_to :fabmoment
  belongs_to :author, class_name: 'User'
end
