module CSVing
  extend ActiveSupport::Concern

  included do
    def self.to_csv
      CSV.generate do |csv|
        csv << column_names
        all.each do |m|
          csv << m.attributes.values_at(*column_names)
        end
      end
    end
  end
end
