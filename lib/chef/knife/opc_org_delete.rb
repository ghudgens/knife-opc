#
# Author:: Steven Danna (<steve@opscode.com>)
# Copyright:: Copyright 2011 Opscode, Inc.
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

module Opc
  class OpcOrgDelete < Chef::Knife
    category "OPSCODE PRIVATE CHEF ORGANIZATION MANAGEMENT"
    banner "knife opc org delete ORG_NAME"

    def run
      org_name = @name_args[0]
      @chef_rest = Chef::REST.new(Chef::Config[:chef_server_root])
      ui.confirm "Do you want to delete the organization #{org_name}"
      ui.output @chef_rest.delete_rest("organizations/#{org_name}")
    end
  end
end
