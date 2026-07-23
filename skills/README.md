# Skills

Agent skills stowed into every path listed in `skill-targets.sh`.

## Stow targets

Configured in `skill-targets.sh` (sourced by `package.sh`):

- `~/.cursor/skills`
- `~/.claude/skills`
- `~/skills`
- `~/.agents/skills/`

Edit that file, then `./dotfiles.sh link skills`.

## Categories

| Dir | README | Contents |
|-----|--------|----------|
| `engineering/` | [README](./engineering/README.md) | Daily code skills (TDD, review, triage, …) |
| `productivity/` | [README](./productivity/README.md) | Workflow tools (grill, handoff, teach, …) |
| `external/` | [README](./external/README.md) | Third-party / vendor skills |
| `work/` | [README](./work/README.md) | Employer / product-specific skills |

Each skill is a directory with a `SKILL.md` (plus optional scripts/agents).

## Layout

```
skills/
├── package.sh
├── skill-targets.sh
├── engineering/
├── productivity/
├── external/
└── work/
```
