#!/bin/bash

CLEAR='\033[0m';
WHITE='\033[1;37m';
GREEN='\033[1;32m';
YELLOW='\033[0;33m';
CYAN='\033[1;36m';

node_bin=./node_modules/.bin;

rollup_commonjs="$node_bin/rollup --config util/rollup.commonjs.config.js";
rollup_bundle="$node_bin/rollup --config util/rollup.bundle.config.js --name ReactRangeMaster --sourcemap";


function create_lib() {
  printf "${WHITE} Transpiling module to ${CYAN}./lib/${CLEAR}..."
  ${rollup_commonjs} && printf "\n [${YELLOW}$(date +%H:%M:%S)${CLEAR}] ${GREEN}Module transpiled.${CLEAR}\n\n";
}
function create_dist() {
  printf "${WHITE} Bundling module in ${CYAN}./dist/${CLEAR}..."
  ${rollup_bundle} && printf "\n [${YELLOW}$(date +%H:%M:%S)${CLEAR}] ${GREEN}Module bundle created.${CLEAR}\n\n";
}

function create_all() {
  create_lib && create_dist;
}

build_lib="no";
build_dist="no";
watch_src="no";

for arg in "$@"
do
  case $arg in
    "lib" | "commonjs" )
      build_lib="yes";;
    "dist" | "bundle" )
      build_dist="yes";;
  esac;
done;

if [ "$build_lib" == "no" ] && [ "$build_dist" == "no" ]; then
  create_all;
elif [ "$build_lib" == "yes" ]; then
  create_lib;
else
  create_dist;
fi;


