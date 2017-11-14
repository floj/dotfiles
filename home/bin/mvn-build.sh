#!/bin/bash
mvnBuild() {
  local projects=()
  local mvnArgs=()
  local currentDir="$(pwd)"
  local result=0

  while [[ "${1+defined}" ]]; do
    if [[ "$1" == "-D"* ]]; then
      mvnArgs+=("$1")
    else
      projects+=("$1")
    fi
    shift
  done

  if [[ "${#projects[@]}" == "0" ]]; then
    projects+=(".")
  fi

  echo "building projects ${projects[@]}"
  echo "  with parameters ${mvnArgs[@]}"

  for project in "${projects[@]}"; do
    if [[ -d "$project" ]]; then
      echo "found directory $project"
    else
      echo "could not find directory $project"
      exit 1
    fi
  done

  echo
  echo "starting build"
  echo

  for project in "${projects[@]}"; do
    echo "changing into $project"
    cd "$project"
    echo "mvn build ${mvnArgs[@]}"
    echo
    mvn install ${mvnArgs[@]}
    result=$?
    cd "$currentDir"
    if [[ $result != 0 ]]; then
      echo 
      echo "build of $project exited with $result, abording."
      exit $result
    fi
    
  done
}

mvnBuild $*
