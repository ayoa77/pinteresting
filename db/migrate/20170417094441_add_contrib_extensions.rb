class AddContribExtensions < ActiveRecord::Migration[5.0]
    def change
      execute 'CREATE EXTENSION pg_trgm;'
      execute 'CREATE EXTENSION fuzzystrmatch;'
    end
end
