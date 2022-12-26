class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def arrange_created_at
    self.created_at.strftime("%Y/%-m/%-d %-H:%-M")
  end
end
