# Opencode - Troubleshooting

**Pages:** 2

---

## Troubleshooting | OpenCode

**URL:** https://opencode.ai/docs/troubleshooting

**Contents:**
- Troubleshooting
  - Logs
  - Storage
- Getting help
- Common issues
  - OpenCode won’t start
  - Authentication issues
  - Model not available
  - ProviderInitError
  - AI_APICallError and provider package issues

Common issues and how to resolve them.

To debug any issues with OpenCode, you can check the logs or the session data that it stores locally.

Log files are written to:

Log files are named with timestamps (e.g., 2025-01-09T123456.log) and the most recent 10 log files are kept.

You can set the log level with the --log-level command-line option to get more detailed debug information. For example, opencode --log-level DEBUG.

opencode stores session data and other application data on disk at:

This directory contains:

If you’re experiencing issues with OpenCode:

Report issues on GitHub

The best way to report bugs or request features is through our GitHub repository:

github.com/anomalyco/opencode/issues

Before creating a new issue, search existing issues to see if your problem has already been reported.

For real-time help and community discussion, join our Discord server:

Here are some common issues and how to resolve them.

If you encounter ProviderModelNotFoundError you are most likely incorrectly referencing a model somewhere. Models should be referenced like so: <providerId>/<modelId>

To figure out what models you have access to, run opencode models

If you encounter a ProviderInitError, you likely have an invalid or corrupted configuration.

First, verify your provider is set up correctly by following the providers guide

If the issue persists, try clearing your stored configuration:

Re-authenticate with your provider using the /connect command in the TUI.

If you encounter API call errors, this may be due to outdated provider packages. opencode dynamically installs provider packages (OpenAI, Anthropic, Google, etc.) as needed and caches them locally.

To resolve provider package issues:

Clear the provider package cache:

Restart opencode to reinstall the latest provider packages

This will force opencode to download the most recent versions of provider packages, which often resolves compatibility issues with model parameters and API changes.

Linux users need to have one of the following clipboard utilities installed for copy/paste functionality to work:

For headless environments:

opencode will detect if you’re using Wayland and prefer wl-clipboard, otherwise it will try to find clipboard tools in order of: xclip and xsel.

**Examples:**

Example 1 (unknown):
```unknown
~/.local/share/opencode/log/
```

Example 2 (unknown):
```unknown
%USERPROFILE%\.local\share\opencode\log\
```

Example 3 (unknown):
```unknown
2025-01-09T123456.log
```

Example 4 (unknown):
```unknown
--log-level
```

---

## Troubleshooting | OpenCode

**URL:** https://opencode.ai/docs/troubleshooting/

**Contents:**
- Troubleshooting
  - Logs
  - Storage
- Getting help
- Common issues
  - OpenCode won’t start
  - Authentication issues
  - Model not available
  - ProviderInitError
  - AI_APICallError and provider package issues

Common issues and how to resolve them.

To debug any issues with OpenCode, you can check the logs or the session data that it stores locally.

Log files are written to:

Log files are named with timestamps (e.g., 2025-01-09T123456.log) and the most recent 10 log files are kept.

You can set the log level with the --log-level command-line option to get more detailed debug information. For example, opencode --log-level DEBUG.

opencode stores session data and other application data on disk at:

This directory contains:

If you’re experiencing issues with OpenCode:

Report issues on GitHub

The best way to report bugs or request features is through our GitHub repository:

github.com/anomalyco/opencode/issues

Before creating a new issue, search existing issues to see if your problem has already been reported.

For real-time help and community discussion, join our Discord server:

Here are some common issues and how to resolve them.

If you encounter ProviderModelNotFoundError you are most likely incorrectly referencing a model somewhere. Models should be referenced like so: <providerId>/<modelId>

To figure out what models you have access to, run opencode models

If you encounter a ProviderInitError, you likely have an invalid or corrupted configuration.

First, verify your provider is set up correctly by following the providers guide

If the issue persists, try clearing your stored configuration:

Re-authenticate with your provider using the /connect command in the TUI.

If you encounter API call errors, this may be due to outdated provider packages. opencode dynamically installs provider packages (OpenAI, Anthropic, Google, etc.) as needed and caches them locally.

To resolve provider package issues:

Clear the provider package cache:

Restart opencode to reinstall the latest provider packages

This will force opencode to download the most recent versions of provider packages, which often resolves compatibility issues with model parameters and API changes.

Linux users need to have one of the following clipboard utilities installed for copy/paste functionality to work:

For headless environments:

opencode will detect if you’re using Wayland and prefer wl-clipboard, otherwise it will try to find clipboard tools in order of: xclip and xsel.

**Examples:**

Example 1 (unknown):
```unknown
~/.local/share/opencode/log/
```

Example 2 (unknown):
```unknown
%USERPROFILE%\.local\share\opencode\log\
```

Example 3 (unknown):
```unknown
2025-01-09T123456.log
```

Example 4 (unknown):
```unknown
--log-level
```

---
