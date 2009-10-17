<% table_name = class_name.underscore.pluralize -%>
<% def add_column_opt(opts, opt)  ", :#{opt} => #{opts[opt]}" if opts && opts.key?(opt) end -%>
class Make<%= class_name.underscore.pluralize.camelize %>Revisable < ActiveRecord::Migration
  def self.up
    <% cols.each do |column_name,column_type,column_opts| -%>
    add_column :<%= table_name %>, :<%= column_name %>, :<%= column_type %><%= add_column_opt(column_opts, :default) %><%= add_column_opt(column_opts, :null) %>
    <% end -%>
  end

  def self.down
    <% cols.each do |column_name,_| -%>
    remove_column :<%= table_name %>, :<%= column_name %>
    <% end -%>
  end
end
