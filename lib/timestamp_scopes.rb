require "active_record"
require "timestamp_scopes/version"

module TimestampScopes
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods

    # Adds scopes for the given timestamp columns.
    # @args is an enumerable list of symbols.
    # For each symbol given, creates a timestamp scope of the same name.
    # The timestamp scope will default to reference a column of the same name,
    # but with a suffix of "_at".
    # So, if :created is passed, then a .created scope will be made, which adds
    # conditions to the :created_at column.
    # If no args are passed, then timestamp scopes will be created for the
    # default timestamp columns, :created_at and updated_at.
    def add_timestamp_scopes(*args)
      args << :created << :updated if args.empty?
      args.each do |scope_name|
        define_timestamp_scope(scope_name)
      end
    end

    # Add a class method name "scope_name", which handles the before and after
    # timestamp scoping DSLs.
    def define_timestamp_scope(scope_name, column_name = nil)
      column_name ||= scope_name.to_s + '_at'

      define_singleton_method(scope_name) do |options|
        options ||= {}

        ops = {
          after:  '>',
          before: '<',
        }

        relation = scoped

        options.each do |op, time|
          relation = relation.where("#{column_name} #{ops[op]} ?", time)
        end

        relation
      end

    end
  end
end

class ActiveRecord::Base
  include TimestampScopes
end
