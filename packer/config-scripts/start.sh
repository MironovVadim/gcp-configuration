#!/bin/bash

git clone https://github.com/MironovVadim/gcp-configuration.git
cd gcp-configuration/config-scripts
(. install_ruby.sh ;
. install_mongodb.sh)