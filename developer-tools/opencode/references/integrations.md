# Opencode - Integrations

**Pages:** 6

---

## GitLab | OpenCode

**URL:** https://opencode.ai/docs/gitlab

**Contents:**
- GitLab
- GitLab CI
  - Features
  - Setup
- GitLab Duo
  - Features
  - Setup
  - Examples

Use OpenCode in GitLab issues and merge requests.

OpenCode integrates with your GitLab workflow through your GitLab CI/CD pipeline or with GitLab Duo.

In both cases, OpenCode will run on your GitLab runners.

OpenCode works in a regular GitLab pipeline. You can build it into a pipeline as a CI component

Here we are using a community-created CI/CD component for OpenCode — nagyv/gitlab-opencode.

Store your OpenCode authentication JSON as a File type CI environment variables under Settings > CI/CD > Variables. Make sure to mark them as “Masked and hidden”.

Add the following to your .gitlab-ci.yml file.

For more inputs and use cases check out the docs for this component.

OpenCode integrates with your GitLab workflow. Mention @opencode in a comment, and OpenCode will execute tasks within your GitLab CI pipeline.

OpenCode runs in your GitLab CI/CD pipeline, here’s what you’ll need to set it up:

Check out the GitLab docs for up to date instructions.

Configure your GitLab environment

Get an AI model provider API key

Create a service account

Configure CI/CD variables

Create a flow config file, here’s an example:

You can refer to the GitLab CLI agents docs for detailed instructions.

Here are some examples of how you can use OpenCode in GitLab.

You can configure to use a different trigger phrase than @opencode.

Add this comment in a GitLab issue.

OpenCode will read the issue and reply with a clear explanation.

In a GitLab issue, say:

OpenCode will create a new branch, implement the changes, and open a merge request with the changes.

Review merge requests

Leave the following comment on a GitLab merge request.

OpenCode will review the merge request and provide feedback.

**Examples:**

Example 1 (unknown):
```unknown
./config/#custom-directory
```

Example 2 (unknown):
```unknown
.gitlab-ci.yml
```

Example 3 (yaml):
```yaml
include:  - component: $CI_SERVER_FQDN/nagyv/gitlab-opencode/opencode@2    inputs:      config_dir: ${CI_PROJECT_DIR}/opencode-config      auth_json: $OPENCODE_AUTH_JSON # The variable name for your OpenCode authentication JSON      command: optional-custom-command      message: "Your prompt here"
```

Example 4 (yaml):
```yaml
include:  - component: $CI_SERVER_FQDN/nagyv/gitlab-opencode/opencode@2    inputs:      config_dir: ${CI_PROJECT_DIR}/opencode-config      auth_json: $OPENCODE_AUTH_JSON # The variable name for your OpenCode authentication JSON      command: optional-custom-command      message: "Your prompt here"
```

---

## GitHub | OpenCode

**URL:** https://opencode.ai/docs/github

**Contents:**
- GitHub
- Features
- Installation
  - Manual Setup
- Configuration
- Supported Events
  - Schedule Example
  - Pull Request Example
  - Issues Triage Example
- Custom prompts

Use OpenCode in GitHub issues and pull-requests.

OpenCode integrates with your GitHub workflow. Mention /opencode or /oc in your comment, and OpenCode will execute tasks within your GitHub Actions runner.

Run the following command in a project that is in a GitHub repo:

This will walk you through installing the GitHub app, creating the workflow, and setting up secrets.

Or you can set it up manually.

Install the GitHub app

Head over to github.com/apps/opencode-agent. Make sure it’s installed on the target repository.

Add the following workflow file to .github/workflows/opencode.yml in your repo. Make sure to set the appropriate model and required API keys in env.

Store the API keys in secrets

In your organization or project settings, expand Secrets and variables on the left and select Actions. And add the required API keys.

model: The model to use with OpenCode. Takes the format of provider/model. This is required.

agent: The agent to use. Must be a primary agent. Falls back to default_agent from config or "build" if not found.

share: Whether to share the OpenCode session. Defaults to true for public repositories.

prompt: Optional custom prompt to override the default behavior. Use this to customize how OpenCode processes requests.

token: Optional GitHub access token for performing operations such as creating comments, committing changes, and opening pull requests. By default, OpenCode uses the installation access token from the OpenCode GitHub App, so commits, comments, and pull requests appear as coming from the app.

Alternatively, you can use the GitHub Action runner’s built-in GITHUB_TOKEN without installing the OpenCode GitHub App. Just make sure to grant the required permissions in your workflow:

You can also use a personal access tokens(PAT) if preferred.

OpenCode can be triggered by the following GitHub events:

Run OpenCode on a schedule to perform automated tasks:

For scheduled events, the prompt input is required since there’s no comment to extract instructions from. Scheduled workflows run without a user context to permission-check, so the workflow must grant contents: write and pull-requests: write if you expect OpenCode to create branches or PRs.

Automatically review PRs when they are opened or updated:

For pull_request events, if no prompt is provided, OpenCode defaults to reviewing the pull request.

Automatically triage new issues. This example filters to accounts older than 30 days to reduce spam:

For issues events, the prompt input is required since there’s no comment to extract instructions from.

Override the default prompt to customize OpenCode’s behavior for your workflow.

This is useful for enforcing specific review criteria, coding standards, or focus areas relevant to your project.

Here are some examples of how you can use OpenCode in GitHub.

Add this comment in a GitHub issue.

OpenCode will read the entire thread, including all comments, and reply with a clear explanation.

In a GitHub issue, say:

And OpenCode will create a new branch, implement the changes, and open a PR with the changes.

Review PRs and make changes

Leave the following comment on a GitHub PR.

OpenCode will implement the requested change and commit it to the same PR.

Review specific code lines

Leave a comment directly on code lines in the PR’s “Files” tab. OpenCode automatically detects the file, line numbers, and diff context to provide precise responses.

When commenting on specific lines, OpenCode receives:

This allows for more targeted requests without needing to specify file paths or line numbers manually.

**Examples:**

Example 1 (unknown):
```unknown
opencode github install
```

Example 2 (unknown):
```unknown
opencode github install
```

Example 3 (unknown):
```unknown
.github/workflows/opencode.yml
```

Example 4 (yaml):
```yaml
name: opencode
on:  issue_comment:    types: [created]  pull_request_review_comment:    types: [created]
jobs:  opencode:    if: |      contains(github.event.comment.body, '/oc') ||      contains(github.event.comment.body, '/opencode')    runs-on: ubuntu-latest    permissions:      id-token: write    steps:       - name: Checkout repository         uses: actions/checkout@v6         with:           fetch-depth: 1           persist-credentials: false
       - name: Run OpenCode        uses: anomalyco/opencode/github@latest        env:          ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}        with:          model: anthropic/claude-sonnet-4-20250514          # share: true          # github_token: xxxx
```

---

## IDE | OpenCode

**URL:** https://opencode.ai/docs/ide/

**Contents:**
- IDE
- Usage
- Installation
  - Manual Install
  - Troubleshooting

The OpenCode extension for VS Code, Cursor, and other IDEs

OpenCode integrates with VS Code, Cursor, or any IDE that supports a terminal. Just run opencode in the terminal to get started.

To install OpenCode on VS Code and popular forks like Cursor, Windsurf, VSCodium:

If on the other hand you want to use your own IDE when you run /editor or /export from the TUI, you’ll need to set export EDITOR="code --wait". Learn more.

Search for OpenCode in the Extension Marketplace and click Install.

If the extension fails to install automatically:

**Examples:**

Example 1 (unknown):
```unknown
Cmd+Shift+Esc
```

Example 2 (unknown):
```unknown
Ctrl+Shift+Esc
```

Example 3 (unknown):
```unknown
Cmd+Option+K
```

Example 4 (python):
```python
@File#L37-42
```

---

## GitHub | OpenCode

**URL:** https://opencode.ai/docs/github/

**Contents:**
- GitHub
- Features
- Installation
  - Manual Setup
- Configuration
- Supported Events
  - Schedule Example
  - Pull Request Example
  - Issues Triage Example
- Custom prompts

Use OpenCode in GitHub issues and pull-requests.

OpenCode integrates with your GitHub workflow. Mention /opencode or /oc in your comment, and OpenCode will execute tasks within your GitHub Actions runner.

Run the following command in a project that is in a GitHub repo:

This will walk you through installing the GitHub app, creating the workflow, and setting up secrets.

Or you can set it up manually.

Install the GitHub app

Head over to github.com/apps/opencode-agent. Make sure it’s installed on the target repository.

Add the following workflow file to .github/workflows/opencode.yml in your repo. Make sure to set the appropriate model and required API keys in env.

Store the API keys in secrets

In your organization or project settings, expand Secrets and variables on the left and select Actions. And add the required API keys.

model: The model to use with OpenCode. Takes the format of provider/model. This is required.

agent: The agent to use. Must be a primary agent. Falls back to default_agent from config or "build" if not found.

share: Whether to share the OpenCode session. Defaults to true for public repositories.

prompt: Optional custom prompt to override the default behavior. Use this to customize how OpenCode processes requests.

token: Optional GitHub access token for performing operations such as creating comments, committing changes, and opening pull requests. By default, OpenCode uses the installation access token from the OpenCode GitHub App, so commits, comments, and pull requests appear as coming from the app.

Alternatively, you can use the GitHub Action runner’s built-in GITHUB_TOKEN without installing the OpenCode GitHub App. Just make sure to grant the required permissions in your workflow:

You can also use a personal access tokens(PAT) if preferred.

OpenCode can be triggered by the following GitHub events:

Run OpenCode on a schedule to perform automated tasks:

For scheduled events, the prompt input is required since there’s no comment to extract instructions from. Scheduled workflows run without a user context to permission-check, so the workflow must grant contents: write and pull-requests: write if you expect OpenCode to create branches or PRs.

Automatically review PRs when they are opened or updated:

For pull_request events, if no prompt is provided, OpenCode defaults to reviewing the pull request.

Automatically triage new issues. This example filters to accounts older than 30 days to reduce spam:

For issues events, the prompt input is required since there’s no comment to extract instructions from.

Override the default prompt to customize OpenCode’s behavior for your workflow.

This is useful for enforcing specific review criteria, coding standards, or focus areas relevant to your project.

Here are some examples of how you can use OpenCode in GitHub.

Add this comment in a GitHub issue.

OpenCode will read the entire thread, including all comments, and reply with a clear explanation.

In a GitHub issue, say:

And OpenCode will create a new branch, implement the changes, and open a PR with the changes.

Review PRs and make changes

Leave the following comment on a GitHub PR.

OpenCode will implement the requested change and commit it to the same PR.

Review specific code lines

Leave a comment directly on code lines in the PR’s “Files” tab. OpenCode automatically detects the file, line numbers, and diff context to provide precise responses.

When commenting on specific lines, OpenCode receives:

This allows for more targeted requests without needing to specify file paths or line numbers manually.

**Examples:**

Example 1 (unknown):
```unknown
opencode github install
```

Example 2 (unknown):
```unknown
opencode github install
```

Example 3 (unknown):
```unknown
.github/workflows/opencode.yml
```

Example 4 (yaml):
```yaml
name: opencode
on:  issue_comment:    types: [created]  pull_request_review_comment:    types: [created]
jobs:  opencode:    if: |      contains(github.event.comment.body, '/oc') ||      contains(github.event.comment.body, '/opencode')    runs-on: ubuntu-latest    permissions:      id-token: write    steps:       - name: Checkout repository         uses: actions/checkout@v6         with:           fetch-depth: 1           persist-credentials: false
       - name: Run OpenCode        uses: anomalyco/opencode/github@latest        env:          ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}        with:          model: anthropic/claude-sonnet-4-20250514          # share: true          # github_token: xxxx
```

---

## IDE | OpenCode

**URL:** https://opencode.ai/docs/ide

**Contents:**
- IDE
- Usage
- Installation
  - Manual Install
  - Troubleshooting

The OpenCode extension for VS Code, Cursor, and other IDEs

OpenCode integrates with VS Code, Cursor, or any IDE that supports a terminal. Just run opencode in the terminal to get started.

To install OpenCode on VS Code and popular forks like Cursor, Windsurf, VSCodium:

If on the other hand you want to use your own IDE when you run /editor or /export from the TUI, you’ll need to set export EDITOR="code --wait". Learn more.

Search for OpenCode in the Extension Marketplace and click Install.

If the extension fails to install automatically:

**Examples:**

Example 1 (unknown):
```unknown
Cmd+Shift+Esc
```

Example 2 (unknown):
```unknown
Ctrl+Shift+Esc
```

Example 3 (unknown):
```unknown
Cmd+Option+K
```

Example 4 (python):
```python
@File#L37-42
```

---

## GitLab | OpenCode

**URL:** https://opencode.ai/docs/gitlab/

**Contents:**
- GitLab
- GitLab CI
  - Features
  - Setup
- GitLab Duo
  - Features
  - Setup
  - Examples

Use OpenCode in GitLab issues and merge requests.

OpenCode integrates with your GitLab workflow through your GitLab CI/CD pipeline or with GitLab Duo.

In both cases, OpenCode will run on your GitLab runners.

OpenCode works in a regular GitLab pipeline. You can build it into a pipeline as a CI component

Here we are using a community-created CI/CD component for OpenCode — nagyv/gitlab-opencode.

Store your OpenCode authentication JSON as a File type CI environment variables under Settings > CI/CD > Variables. Make sure to mark them as “Masked and hidden”.

Add the following to your .gitlab-ci.yml file.

For more inputs and use cases check out the docs for this component.

OpenCode integrates with your GitLab workflow. Mention @opencode in a comment, and OpenCode will execute tasks within your GitLab CI pipeline.

OpenCode runs in your GitLab CI/CD pipeline, here’s what you’ll need to set it up:

Check out the GitLab docs for up to date instructions.

Configure your GitLab environment

Get an AI model provider API key

Create a service account

Configure CI/CD variables

Create a flow config file, here’s an example:

You can refer to the GitLab CLI agents docs for detailed instructions.

Here are some examples of how you can use OpenCode in GitLab.

You can configure to use a different trigger phrase than @opencode.

Add this comment in a GitLab issue.

OpenCode will read the issue and reply with a clear explanation.

In a GitLab issue, say:

OpenCode will create a new branch, implement the changes, and open a merge request with the changes.

Review merge requests

Leave the following comment on a GitLab merge request.

OpenCode will review the merge request and provide feedback.

**Examples:**

Example 1 (unknown):
```unknown
./config/#custom-directory
```

Example 2 (unknown):
```unknown
.gitlab-ci.yml
```

Example 3 (yaml):
```yaml
include:  - component: $CI_SERVER_FQDN/nagyv/gitlab-opencode/opencode@2    inputs:      config_dir: ${CI_PROJECT_DIR}/opencode-config      auth_json: $OPENCODE_AUTH_JSON # The variable name for your OpenCode authentication JSON      command: optional-custom-command      message: "Your prompt here"
```

Example 4 (yaml):
```yaml
include:  - component: $CI_SERVER_FQDN/nagyv/gitlab-opencode/opencode@2    inputs:      config_dir: ${CI_PROJECT_DIR}/opencode-config      auth_json: $OPENCODE_AUTH_JSON # The variable name for your OpenCode authentication JSON      command: optional-custom-command      message: "Your prompt here"
```

---
