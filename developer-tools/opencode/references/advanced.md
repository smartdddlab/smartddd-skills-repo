# Opencode - Advanced

**Pages:** 4

---

## Ecosystem | OpenCode

**URL:** https://opencode.ai/docs/ecosystem/

**Contents:**
- Ecosystem
- Plugins
- Projects
- Agents

Projects and integrations built with OpenCode.

A collection of community projects built on OpenCode.

Want to add your OpenCode related project to this list? Submit a PR.

You can also check out awesome-opencode and opencode.cafe, a community that aggregates the ecosystem and community.

---

## Ecosystem | OpenCode

**URL:** https://opencode.ai/docs/ecosystem

**Contents:**
- Ecosystem
- Plugins
- Projects
- Agents

Projects and integrations built with OpenCode.

A collection of community projects built on OpenCode.

Want to add your OpenCode related project to this list? Submit a PR.

You can also check out awesome-opencode and opencode.cafe, a community that aggregates the ecosystem and community.

---

## LSP Servers | OpenCode

**URL:** https://opencode.ai/docs/lsp

**Contents:**
- LSP Servers
- Built-in
- How It Works
- Configure
  - Disabling LSP servers
  - Custom LSP servers
- Additional Information
  - PHP Intelephense

OpenCode integrates with your LSP servers.

OpenCode integrates with your Language Server Protocol (LSP) to help the LLM interact with your codebase. It uses diagnostics to provide feedback to the LLM.

OpenCode comes with several built-in LSP servers for popular languages:

LSP servers are automatically enabled when one of the above file extensions are detected and the requirements are met.

You can disable automatic LSP server downloads by setting the OPENCODE_DISABLE_LSP_DOWNLOAD environment variable to true.

When opencode opens a file, it:

You can customize LSP servers through the lsp section in your opencode config.

Each LSP server supports the following:

Let’s look at some examples.

To disable all LSP servers globally, set lsp to false:

To disable a specific LSP server, set disabled to true:

You can add custom LSP servers by specifying the command and file extensions:

PHP Intelephense offers premium features through a license key. You can provide a license key by placing (only) the key in a text file at:

The file should contain only the license key with no additional content.

**Examples:**

Example 1 (unknown):
```unknown
clojure-lsp
```

Example 2 (unknown):
```unknown
Java SDK (version 21+)
```

Example 3 (unknown):
```unknown
rust-analyzer
```

Example 4 (unknown):
```unknown
OPENCODE_DISABLE_LSP_DOWNLOAD
```

---

## LSP Servers | OpenCode

**URL:** https://opencode.ai/docs/lsp/

**Contents:**
- LSP Servers
- Built-in
- How It Works
- Configure
  - Disabling LSP servers
  - Custom LSP servers
- Additional Information
  - PHP Intelephense

OpenCode integrates with your LSP servers.

OpenCode integrates with your Language Server Protocol (LSP) to help the LLM interact with your codebase. It uses diagnostics to provide feedback to the LLM.

OpenCode comes with several built-in LSP servers for popular languages:

LSP servers are automatically enabled when one of the above file extensions are detected and the requirements are met.

You can disable automatic LSP server downloads by setting the OPENCODE_DISABLE_LSP_DOWNLOAD environment variable to true.

When opencode opens a file, it:

You can customize LSP servers through the lsp section in your opencode config.

Each LSP server supports the following:

Let’s look at some examples.

To disable all LSP servers globally, set lsp to false:

To disable a specific LSP server, set disabled to true:

You can add custom LSP servers by specifying the command and file extensions:

PHP Intelephense offers premium features through a license key. You can provide a license key by placing (only) the key in a text file at:

The file should contain only the license key with no additional content.

**Examples:**

Example 1 (unknown):
```unknown
clojure-lsp
```

Example 2 (unknown):
```unknown
Java SDK (version 21+)
```

Example 3 (unknown):
```unknown
rust-analyzer
```

Example 4 (unknown):
```unknown
OPENCODE_DISABLE_LSP_DOWNLOAD
```

---
