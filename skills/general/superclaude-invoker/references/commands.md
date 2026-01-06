# Command Classification Reference

This document provides detailed command patterns and trigger mappings for the SuperClaude Invoker skill.

## Command Categories

### Code Development

| Command | Pattern | Description |
|---------|---------|-------------|
| `/sc:implement` | build, create, implement, develop, add [feature] | Implement feature code |
| `/sc:build` | build, compile, package, construct | Build project with framework detection |

### Problem Analysis

| Command | Pattern | Description |
|---------|---------|-------------|
| `/sc:analyze` | analyze, review, examine, investigate, audit | Multi-dimensional code analysis |
| `/sc:troubleshoot` | troubleshoot, debug, fix, diagnose, resolve | Problem diagnosis and resolution |

### Quality Improvement

| Command | Pattern | Description |
|---------|---------|-------------|
| `/sc:improve` | improve, refactor, optimize, enhance, upgrade | Code quality and performance improvement |
| `/sc:cleanup` | cleanup, clean, remove dead code, reduce tech debt | Project cleanup and tech debt reduction |

### Testing & Verification

| Command | Pattern | Description |
|---------|---------|-------------|
| `/sc:test` | test, run tests, testing, verify | Test workflow execution |

### Git Workflow

| Command | Pattern | Description |
|---------|---------|-------------|
| `/sc:git` | git, commit, pr, branch, merge | Git workflow assistance |

### Documentation

| Command | Pattern | Description |
|---------|---------|-------------|
| `/sc:document` | document, docs, generate docs, write docs | Documentation generation |
| `/sc:explain` | explain, understand, clarify | Code explanation |

### Design & Architecture

| Command | Pattern | Description |
|---------|---------|-------------|
| `/sc:design` | design, architecture, plan structure | System architecture design |
| `/sc:estimate` | estimate, plan, scope | Development estimation |
| `/sc:task` | task, todo, manage | Task management |

### Meta Commands

| Command | Pattern | Description |
|---------|---------|-------------|
| `/sc:spawn` | spawn, orchestrate, delegate | Meta-task orchestration |
| `/sc:load` | load, restore, resume | Project context loading |
| `/sc:save` | save, checkpoint, persist | Session state saving |
| `/sc:reflect` | reflect, analyze, review | Task reflection |

## Trigger Pattern Mapping

### Development Triggers

```
/sc:implement {target} {flags}
├─ build [feature] → /sc:implement [feature]
├─ create [component] → /sc:implement [component] --type component
├─ implement [api] → /sc:implement [api] --type api
├─ develop [service] → /sc:implement [service] --type service
└─ add [functionality] → /sc:implement [functionality] --type feature

/sc:build {target} {flags}
├─ build [project] → /sc:build [project]
├─ compile [app] → /sc:build [app]
├─ package [application] → /sc:build [application]
└─ construct [system] → /sc:build [system]
```

### Analysis Triggers

```
/sc:analyze {target} {flags}
├─ analyze [code] → /sc:analyze [code]
├─ review [module] → /sc:analyze [module]
├─ examine [file] → /sc:analyze [file]
├─ investigate [component] → /sc:analyze [component]
├─ audit [system] → /sc:analyze [system] --scope system
└─ understand [codebase] → /sc:analyze [codebase] --scope project --think

/sc:troubleshoot {symptoms} {flags}
├─ troubleshoot [issue] → /sc:troubleshoot [issue]
├─ debug [problem] → /sc:troubleshoot [problem]
├─ fix [bug] → /sc:troubleshoot [bug]
├─ diagnose [error] → /sc:troubleshoot [error]
└─ resolve [issue] → /sc:troubleshoot [issue] --think
```

### Quality Triggers

```
/sc:improve {target} {flags}
├─ improve [code] → /sc:improve [code]
├─ refactor [module] → /sc:improve [module]
├─ optimize [function] → /sc:improve [function] --focus performance
├─ enhance [component] → /sc:improve [component]
├─ upgrade [system] → /sc:improve [system]
└─ polish [codebase] → /sc:improve [codebase] --loop --think

/sc:cleanup {target} {flags}
├─ cleanup [directory] → /sc:cleanup [directory]
├─ clean [project] → /sc:cleanup [project]
├─ remove dead code → /sc:cleanup . --focus quality
└─ reduce tech debt → /sc:cleanup . --focus quality --loop
```

### Testing Triggers

```
/sc:test {type} {flags}
├─ test [target] → /sc:test [type]
├─ run tests → /sc:test unit
├─ unit tests → /sc:test unit
├─ integration tests → /sc:test integration
├─ e2e tests → /sc:test e2e --e2e
├─ comprehensive test → /sc:test comprehensive --coverage --e2e --think
└─ performance benchmark → /sc:test comprehensive --benchmark
```

### Git Triggers

```
/sc:git {operation} {flags}
├─ git commit → /sc:git commit
├─ create commit → /sc:git commit
├─ commit with message → /sc:git commit --message [message]
├─ create PR → /sc:git pr create
├─ open pull request → /sc:git pr create
├─ merge branch → /sc:git merge [branch]
├─ create branch → /sc:git branch create [branch]
└─ analyze commits → /sc:git log --analyze
```

### Documentation Triggers

```
/sc:document {target} {flags}
├─ document [code] → /sc:document [code]
├─ generate docs → /sc:document .
├─ write documentation → /sc:document .
├─ api docs → /sc:document api --type api
├─ readme → /sc:document README.md
└─ user guide → /sc:document guide --type guide

/sc:explain {topic} {flags}
├─ explain [code] → /sc:explain [code]
├─ understand [concept] → /sc:explain [concept]
├─ clarify [function] → /sc:explain [function]
└─ how does [work] → /sc:explain [work]
```

### Design Triggers

```
/sc:design {domain} {flags}
├─ design [system] → /sc:design [system]
├─ architecture [app] → /sc:design [app]
├─ plan structure → /sc:design .
├─ design API → /sc:design api --type api
└─ design component → /sc:design component --type component --think

/sc:estimate {target} {flags}
├─ estimate [feature] → /sc:estimate [feature]
├─ plan [project] → /sc:estimate [project]
├─ scope [work] → /sc:estimate [work]
└─ effort [task] → /sc:estimate [task] --think
```

### Meta Triggers

```
/sc:spawn {mode} {flags}
├─ spawn [task] → /sc:spawn [mode]
├─ orchestrate [operation] → /sc:spawn orchestrate --think
├─ delegate [work] → /sc:spawn delegate
└─ complex task → /sc:spawn --think --loop

/sc:load {path} {flags}
├─ load [context] → /sc:load [path]
├─ restore [session] → /sc:load [path]
└─ resume [project] → /sc:load [path] --seq

/sc:save {path} {flags}
├─ save [context] → /sc:save [path]
├─ checkpoint → /sc:save .
└─ persist [state] → /sc:save [path] --serena
```

## Flag Application by Context

### Automatic Flag Inference

| Context | Inferred Flag | Example |
|---------|---------------|---------|
| "security analysis" | `--focus security` | analyze security → /sc:analyze --focus security |
| "performance optimization" | `--focus performance` | optimize performance → /sc:improve --focus performance |
| "refactor carefully" | `--safe` | refactor safe → /sc:improve --safe |
| "thorough review" | `--think` | analyze thoroughly → /sc:analyze --think |
| "iterate on improvements" | `--loop` | improve iteratively → /sc:improve --loop --think |
| "validate changes" | `--validate` | implement with validation → /sc:implement --validate |
| "complex orchestration" | `--think --loop` | complex multi-step task → /sc:spawn --think --loop |

### Flag Combinations

| Scenario | Command | Flags |
|----------|---------|-------|
| Secure refactoring | `/sc:improve` | `--safe --validate --loop --think` |
| Deep security audit | `/sc:analyze` | `--focus security --think-hard --seq` |
| Performance optimization | `/sc:improve` | `--focus performance --benchmark --loop --think` |
| Component creation | `/sc:implement` | `--type component --validate` |
| API development | `/sc:implement` | `--type api --framework express --validate` |
| Comprehensive testing | `/sc:test` | `--coverage --benchmark --e2e` |
| Complex orchestration | `/sc:spawn` | `--think --loop --seq` |
| Meta-reflection | `/sc:reflect` | `--think --seq` |
