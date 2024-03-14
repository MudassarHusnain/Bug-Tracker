class Bug < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :developer, class_name: 'User', foreign_key: 'developer_id'
  belongs_to :project


  # validates :bug_status, inclusion: { in: ['new', 'started', 'complete'] }
  enum bug_status: {brand_NEW: 0, started:1, complete:2}
  enum bug_type: {feature:0, bug:1}
end
