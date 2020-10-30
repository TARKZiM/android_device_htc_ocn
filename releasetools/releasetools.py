# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

def FullOTA_InstallEnd(info):
  info.script.AppendExtra('if (getprop("ro.boot.mid") == "2PZC30000" || getprop("ro.boot.mid") == "2PZC40000") then')
  info.script.Print("********")
  info.script.Print("This is a DS device - renaming radio props")
  info.script.AppendExtra('run_program("/tmp/install/bin/variant_script.sh");')
  info.script.Print("********")
  info.script.Print("Renaming done.")
  info.script.AppendExtra('endif;')
