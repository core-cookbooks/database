#
# Copyright:: Copyright (c) 2015 Cloudenablers.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require File.join(File.dirname(__FILE__), 'resource_database')
require File.join(File.dirname(__FILE__), 'provider_database_postgresql_schema')

class Chef
  class Resource
    class PostgresqlDatabaseSchema < Chef::Resource::Database
      def initialize(name, run_context = nil)
        super
        @resource_name = :postgresql_database_schema
        @schema_name = name
        @allowed_actions.push(:create, :drop)
        @action = :create
        @provider = Chef::Provider::Database::PostgresqlSchema
      end

      def schema_name(arg = nil)
        set_or_return(
          :schema_name,
          arg,
          :kind_of => String
        )
      end
    end
  end
end
