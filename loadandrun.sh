#!/bin/bash

/exec/loader /config/loader_config.json

while true
do
    /exec/api /config/api_config.json
done