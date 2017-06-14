class Houses < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many
    primary_key: :id,
    foreign_key: :house_id,
    class_name: "Person"
end
