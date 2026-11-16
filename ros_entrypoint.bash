#!/bin/bash
set -e

# ROS, $ROS_UNDERLAY and the $ROS2_WS overlay are sourced at the top of .bashrc,
# shared with `docker exec -it <container> bash`.
source /root/.bashrc
exec "$@"
