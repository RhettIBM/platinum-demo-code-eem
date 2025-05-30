#!/bin/bash
# © Copyright IBM Corporation 2022
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


# New Openshifts dont have their image registry configured
oc patch configs.imageregistry.operator.openshift.io cluster --type merge -p '{"spec":{"managementState":"Managed"}}'
# set ephemeral storage  
oc patch configs.imageregistry.operator.openshift.io cluster \
  --type merge -p '{"spec":{"storage":{"emptyDir":{}}}}'
# expose repo
oc patch configs.imageregistry.operator.openshift.io cluster \
  --type merge -p '{"spec":{"defaultRoute":true}}'
# verfiy its running 
oc get pods -n openshift-image-registry