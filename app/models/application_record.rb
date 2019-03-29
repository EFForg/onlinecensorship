class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

  def self.search_any(attrs)
    attrs.join("_or_")
  end

  def self.translated_search_any(attrs)
    attrs.map { |a| "translations_#{a}" }.join("_or_")
  end
end
