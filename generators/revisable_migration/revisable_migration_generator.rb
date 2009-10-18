class RevisableMigrationGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      revisable_columns = [
        ["revisable_original_id",      "integer", {:index => true}],
        ["revisable_branched_from_id", "integer",  {:index => true}],
        ["revisable_number",           "integer", {:default => 0, :null => false, :index => true}],
        ["revisable_name",             "string"],
        ["revisable_type",             "string"],
        ["revisable_current_at",       "datetime"],
        ["revisable_revised_at",       "datetime"],
        ["revisable_deleted_at",       "datetime"],
        ["revisable_is_current",       "boolean", {:default => 1, :null => false, :index => true}]
      ]
      
      m.migration_template 'migration.rb', 'db/migrate',
        :migration_file_name => "make_#{class_name.underscore.pluralize}_revisable",
        :assigns => { :cols => revisable_columns }
    end
  end
end
