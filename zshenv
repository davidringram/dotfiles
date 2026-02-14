echo "Hello from .zshenv"

function exists() {
  # this is pretty much the which command
  command -v $1 >/dev/null 2>&1
}

