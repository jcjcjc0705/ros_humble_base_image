# ROS Humble Base Image

A personal Docker base image built on top of `ros:humble-ros-core-jammy` (Ubuntu 22.04), pre-installed with ROS2 Humble and common development tools.

## Image

```
registry.screamtrumpet.csie.ncku.edu.tw/pochun/ros_humble_base_image:latest
```

## What's Included

- **ROS2 Humble** — ros-base, rosbridge, fastrtps middleware, domain-bridge
- **Development tools** — git, vim, tmux, htop, nvtop, clang-format, cppcheck, and more
- **C++ libraries** — Boost, libserial, nlohmann-json
- **Python** — pip, venv, orjson, pydantic 1.10, pyserial
- **Shell** — oh-my-bash with agnoster theme

## Shortcuts

| Alias | Command |
|-------|---------|
| `r` | `colcon build` + `source install/setup.bash` |
| `b` | Launch rosbridge WebSocket server |
| `m` | `make -j` |
| `l` | `ls -lash` |

## Run

```bash
docker run -it --rm registry.screamtrumpet.csie.ncku.edu.tw/pochun/ros_humble_base_image:latest
```

## Build Locally

```bash
# Build for current architecture only
bash scripts/local_build.sh

# Build for amd64 + arm64 and push
bash scripts/local_buildx_push.sh -t 1.0.0
```

## CI/CD

Pushing a tag to this repository triggers GitLab CI to build amd64 and arm64 natively on separate runners, then combine them into one multi-arch manifest and push it under both the tag name and `latest`.
