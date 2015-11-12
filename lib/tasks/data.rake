namespace :data do
  desc "Imports data from db/import.sql"
  task :import => :environment do

    connection = ActiveRecord::Base.connection
      connection.tables.each do |table|
        connection.execute("TRUNCATE #{table}") unless table == "schema_migrations"
      end

      sql = File.read('db/import.sql')
      statements = sql.split(/;$/)
      statements.pop # remove blank line at end???

      ActiveRecord::Base.transaction do
        statements.each do |statement|
          connection.execute(statement)
        end
      end


  end

end
