class PropertyBook < ApplicationRecord
  belongs_to :property
  belongs_to :user

  before_create :calculate_total_value

  def calculate_total_value
    self.total_value = (end_date-start_date).to_i*property.daily_rate
  end
end
