class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

  def self.translated_search(attrs)
    attrs.join("_or_")
  end
end
