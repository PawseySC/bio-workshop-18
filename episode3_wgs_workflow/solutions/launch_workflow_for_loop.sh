#!/bin/bash

bash 0.pull_containers_for_loop.sh

for i in {1..6} ; do
  bash ${i}.*.sh
done
