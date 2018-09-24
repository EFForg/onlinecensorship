class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

  def self.translated_search(attrs)
    attrs.map { |a| "translations_#{a}" }.join('_or_')
  end
end
