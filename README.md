# ROS Humble Base Image

A personal Docker base image built on top of `ros:humble-ros-core-jammy` (Ubuntu 22.04), pre-installed with ROS2 Humble and common development tools.

## Image

```
ghcr.io/jcjcjc0705/ros_humble_base_image:latest
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
docker run -it --rm ghcr.io/jcjcjc0705/ros_humble_base_image:latest
```

## Build Locally

```bash
# Build for current architecture only
bash scripts/local_build.sh

# Build for amd64 + arm64 and push
bash scripts/local_buildx_push.sh -t 1.0.0
```

## CI/CD

Builds run on GitHub Actions ([`.github/workflows/docker-publish.yml`](.github/workflows/docker-publish.yml)).

Pushing a tag builds amd64 (`ubuntu-24.04`) and arm64 (`ubuntu-24.04-arm`) natively on separate runners, then combines them into one multi-arch manifest and pushes it to GHCR under both the tag name and `latest`:

```bash
git tag 0.2.0
git push origin 0.2.0
```

You can also start a build from the **Actions** tab (*Run workflow*). A manual run on a branch only publishes `sha-<short commit>`, so `latest` doesn't move.

The image goes to `ghcr.io/<repo owner>/ros_humble_base_image`, using the built-in `GITHUB_TOKEN`, so no secrets are needed.
