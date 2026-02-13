# Shell options and behavior configuration

# =============================================================================
# History Configuration
# =============================================================================
# Share history across all shells in real-time
setopt SHARE_HISTORY

# Remove duplicates from history
setopt HIST_IGNORE_ALL_DUPS

# Don't save commands that start with a space
setopt HIST_IGNORE_SPACE

# Increase history file size
HISTFILESIZE=10000000

# =============================================================================
# Directory Navigation
# =============================================================================
# Automatically push directories onto the directory stack
setopt AUTO_PUSHD

# Don't push duplicate directories onto the stack
setopt PUSHD_IGNORE_DUPS

# Keep last 10 directories in the stack (use 'pd' or 'popd' to navigate back)
DIRSTACKSIZE=10

# =============================================================================
# Prompt Configuration
# =============================================================================
# Show current directory on the right side (helpful for git submodules / multiple projects)
RPROMPT='%F{240}%~%f'
