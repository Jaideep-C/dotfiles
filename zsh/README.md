# Zsh Configuration

A modular, well-organized zsh configuration using Oh My Zsh.

## Structure

The configuration is split into multiple files for better organization and maintainability:

```
zsh/
├── .zshrc           # Main entry point - sources all other files
├── path.zsh         # PATH configuration
├── agent-env.zsh    # MCP / Cursor harness / skill credentials (loads local secrets)
├── oh-my-zsh.zsh    # Oh My Zsh framework and plugin definitions
├── plugins.zsh      # Post-load plugin configuration (fzf, etc.)
├── options.zsh      # Shell options, history, and prompt settings
├── aliases.zsh      # Command aliases
├── tools.zsh        # External development tools initialization
└── README.md        # This file
```

## File Descriptions

### `.zshrc`
The main configuration file that sources all other modules in the correct order. This is the only file that should be symlinked to `~/.zshrc`.

### `path.zsh`
Configures the `PATH` environment variable. Order matters here - earlier entries take precedence.

**Contains:**
- User binaries (`~/.local/bin`, `~/bin`)
- Development tool paths (jenv, LM Studio, etc.)

### `agent-env.zsh`
Credentials for AI agent tooling — not general shell config.

**Used by:** MCP servers (MongoDB, etc.), Cursor agent harness, dotfiles skills (e.g. `asato-api`).

**Secrets live in:** `agent-env.local.zsh` (gitignored). Copy from `agent-env.local.zsh.example`.

**Contains:** nothing by itself; sources the local file if present. Falls back to legacy `~/.mcp-env` during migration.

### `oh-my-zsh.zsh`
Configures and loads the Oh My Zsh framework.

**Contains:**
- Theme selection
- Oh My Zsh settings
- Plugin definitions
- Framework initialization

### `plugins.zsh`
Post-load configuration for plugins that need to be loaded after Oh My Zsh.

**Contains:**
- fzf (fuzzy finder) integration
- Other plugin-specific configurations that need special handling

**Note:** fzf hooks into `zvm_after_init` here so it loads after zsh-vi-mode's lazy init on the first prompt (which would otherwise override Ctrl+R).

### `options.zsh`
Shell behavior and appearance settings.

**Contains:**
- History configuration (sharing, deduplication, size)
- Directory navigation (auto-pushd, directory stack)
- Prompt customization (RPROMPT)

### `aliases.zsh`
Command aliases for convenience and productivity.

**Contains:**
- Configuration editing shortcuts
- Terminal management aliases
- Directory navigation helpers
- Kubernetes shortcuts
- Development workflow aliases

### `tools.zsh`
Initialization and configuration for external development tools.

**Contains:**
- Docker CLI completions
- pyenv (Python version manager)
- jenv (Java version manager)
- kubebuilder completions
- Completion system initialization

## Loading Order

The files are sourced in this specific order:

1. **path.zsh** - Set up PATH first so tools can be found
2. **agent-env.zsh** - Load MCP / skill credentials (before tools that may need them)
3. **oh-my-zsh.zsh** - Load the framework and plugins
4. **plugins.zsh** - Configure plugins that need post-load setup
5. **options.zsh** - Set shell options and behavior
6. **aliases.zsh** - Define command aliases
7. **tools.zsh** - Initialize external tools (after completions are set up)

This order ensures that dependencies are loaded before they're needed.

## Customization

### Adding New Aliases
Edit `aliases.zsh` and add your alias:
```zsh
alias myalias='my command'
```

### Adding Oh My Zsh Plugins
Edit `oh-my-zsh.zsh` and add to the plugins array:
```zsh
plugins=(git kubectl your-new-plugin)
```

### Adding to PATH
Edit `path.zsh` and add your new path:
```zsh
export PATH="/your/new/path:$PATH"
```

### Adding New Shell Options
Edit `options.zsh` and add your setopt:
```zsh
setopt YOUR_NEW_OPTION
```

### Integrating New Tools
Edit `tools.zsh` and add initialization code:
```zsh
# Your Tool
if command -v yourtool &> /dev/null; then
  eval "$(yourtool init)"
fi
```


## Requirements

- **Oh My Zsh**: Install from [ohmyz.sh](https://ohmyz.sh/)
- **fzf**: Install with `brew install fzf`
- **zsh-vi-mode**: Install in `~/.oh-my-zsh/custom/plugins/zsh-vi-mode`
