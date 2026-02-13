# Zsh Configuration

A modular, well-organized zsh configuration using Oh My Zsh.

## Structure

The configuration is split into multiple files for better organization and maintainability:

```
zsh/
├── .zshrc           # Main entry point - sources all other files
├── path.zsh         # PATH configuration and environment variables
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

**Note:** fzf is loaded here (after oh-my-zsh) to prevent zsh-vi-mode from overriding the Ctrl+R keybinding.

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
2. **oh-my-zsh.zsh** - Load the framework and plugins
3. **plugins.zsh** - Configure plugins that need post-load setup
4. **options.zsh** - Set shell options and behavior
5. **aliases.zsh** - Define command aliases
6. **tools.zsh** - Initialize external tools (after completions are set up)

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
