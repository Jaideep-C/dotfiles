# =============================================================================
# Agent environment — MCP servers, Cursor harness, dotfiles skills
# =============================================================================
# Credentials and connection strings for AI tooling (not general shell use).
#
# Copy agent-env.local.zsh.example -> agent-env.local.zsh and fill in values.
# agent-env.local.zsh is gitignored; never commit secrets.

if [[ -f "${ZCONFIG_DIR}/agent-env.local.zsh" ]]; then
  source "${ZCONFIG_DIR}/agent-env.local.zsh"
elif [[ -f "${HOME}/.mcp-env" ]]; then
  # Legacy location; migrate to agent-env.local.zsh
  source "${HOME}/.mcp-env"
fi
