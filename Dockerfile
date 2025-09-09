FROM python:3.11-slim

# Install gdtoolkit for Godot 4 (change to "gdtoolkit==3.*" for Godot 3)
RUN pip3 install --no-cache-dir "gdtoolkit==4.*"

# Set working directory
WORKDIR /workspace

# Default command
CMD ["bash"]
