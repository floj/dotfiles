#!/bin/sh

function applyPolicies() {
  local dirs=$(find $1 -name "local_policy.jar" -exec dirname {} \;)
  local jdkVersion
  local policyFile
  for dir in $dirs; do
    jdkVersion=$(echo $dir | sed "s/.*\/jdk1\.\([0-9]\)\.[0-9]_[0-9]\+\/.*/\1/g")
    policyFile="jce_policy-$jdkVersion"
    echo "extracting $policyFile to $dir"
    unzip -ojq $policyFile -d $dir
  done
}

applyPolicies $1
