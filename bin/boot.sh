# ------------------------------------------------------------------------------------------------
# Copyright 2013 Jordon Bedwell.
# Apache License.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file
# except  in compliance with the License. You may obtain a copy of the License at:
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the
# License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
# either express or implied. See the License for the specific language governing permissions
# and  limitations under the License.
# ------------------------------------------------------------------------------------------------

export APP_ROOT=$HOME
export LD_LIBRARY_PATH=$APP_ROOT/nginx/nginx/lib:$LD_LIBRARY_PATH

conf_file=$APP_ROOT/nginx/nginx/conf/nginx.conf

erb $conf_file > $APP_ROOT/nginx/nginx/conf/nginx-final.conf

# ------------------------------------------------------------------------------------------------

touch $APP_ROOT/nginx/nginx/logs/access.log
touch $APP_ROOT/nginx/nginx/logs/error.log

(tail -f -n 0 $APP_ROOT/nginx/nginx/logs/*.log &)
exec $APP_ROOT/nginx/nginx/sbin/nginx -p $APP_ROOT/nginx -c $APP_ROOT/nginx/nginx/conf/nginx-final.conf

# ------------------------------------------------------------------------------------------------
