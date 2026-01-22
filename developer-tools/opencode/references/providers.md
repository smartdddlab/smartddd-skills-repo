# Opencode - Providers

**Pages:** 6

---

## Models | OpenCode

**URL:** https://opencode.ai/docs/models

**Contents:**
- Models
- Providers
- Select a model
- Recommended models
- Set a default
- Configure models
- Variants
  - Built-in variants
  - Custom variants
  - Cycle variants

Configuring an LLM provider and model.

OpenCode uses the AI SDK and Models.dev to support 75+ LLM providers and it supports running local models.

Most popular providers are preloaded by default. If you’ve added the credentials for a provider through the /connect command, they’ll be available when you start OpenCode.

Learn more about providers.

Once you’ve configured your provider you can select the model you want by typing in:

There are a lot of models out there, with new models coming out every week.

Consider using one of the models we recommend.

However, there are only a few of them that are good at both generating code and tool calling.

Here are several models that work well with OpenCode, in no particular order. (This is not an exhaustive list nor is it necessarily up to date):

To set one of these as the default model, you can set the model key in your OpenCode config.

Here the full ID is provider_id/model_id. For example, if you’re using OpenCode Zen, you would use opencode/gpt-5.1-codex for GPT 5.1 Codex.

If you’ve configured a custom provider, the provider_id is key from the provider part of your config, and the model_id is the key from provider.models.

You can globally configure a model’s options through the config.

Here we’re configuring global settings for two built-in models: gpt-5 when accessed via the openai provider, and claude-sonnet-4-20250514 when accessed via the anthropic provider. The built-in provider and model names can be found on Models.dev.

You can also configure these options for any agents that you are using. The agent config overrides any global options here. Learn more.

You can also define custom variants that extend built-in ones. Variants let you configure different settings for the same model without creating duplicate entries:

Many models support multiple variants with different configurations. OpenCode ships with built-in default variants for popular providers.

OpenCode ships with default variants for many providers:

Varies by model but roughly:

This list is not comprehensive. Many other providers have built-in defaults too.

You can override existing variants or add your own:

Use the keybind variant_cycle to quickly switch between variants. Learn more.

When OpenCode starts up, it checks for models in the following priority order:

The --model or -m command line flag. The format is the same as in the config file: provider_id/model_id.

The model list in the OpenCode config.

The format here is provider/model.

The first model using an internal priority.

**Examples:**

Example 1 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "model": "lmstudio/google/gemma-3n-e4b"}
```

Example 2 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "model": "lmstudio/google/gemma-3n-e4b"}
```

Example 3 (unknown):
```unknown
provider_id/model_id
```

Example 4 (unknown):
```unknown
opencode/gpt-5.1-codex
```

---

## Providers | OpenCode

**URL:** https://opencode.ai/docs/providers/

**Contents:**
- Providers
  - Credentials
  - Config
    - Base URL
- OpenCode Zen
- Directory
  - 302.AI
  - Amazon Bedrock
    - Environment Variables (Quick Start)
    - Configuration File (Recommended)

Using any LLM provider in OpenCode.

OpenCode uses the AI SDK and Models.dev to support 75+ LLM providers and it supports running local models.

To add a provider you need to:

When you add a provider’s API keys with the /connect command, they are stored in ~/.local/share/opencode/auth.json.

You can customize the providers through the provider section in your OpenCode config.

You can customize the base URL for any provider by setting the baseURL option. This is useful when using proxy services or custom endpoints.

OpenCode Zen is a list of models provided by the OpenCode team that have been tested and verified to work well with OpenCode. Learn more.

If you are new, we recommend starting with OpenCode Zen.

Run the /connect command in the TUI, select opencode, and head to opencode.ai/auth.

Sign in, add your billing details, and copy your API key.

Run /models in the TUI to see the list of models we recommend.

It works like any other provider in OpenCode and is completely optional to use.

Let’s look at some of the providers in detail. If you’d like to add a provider to the list, feel free to open a PR.

Don’t see a provider here? Submit a PR.

Head over to the 302.AI console, create an account, and generate an API key.

Run the /connect command and search for 302.AI.

Enter your 302.AI API key.

Run the /models command to select a model.

To use Amazon Bedrock with OpenCode:

Head over to the Model catalog in the Amazon Bedrock console and request access to the models you want.

You need to have access to the model you want in Amazon Bedrock.

Configure authentication using one of the following methods:

Set one of these environment variables while running opencode:

Or add them to your bash profile:

For project-specific or persistent configuration, use opencode.json:

Configuration file options take precedence over environment variables.

If you’re using VPC endpoints for Bedrock:

The endpoint option is an alias for the generic baseURL option, using AWS-specific terminology. If both endpoint and baseURL are specified, endpoint takes precedence.

Amazon Bedrock uses the following authentication priority:

When a bearer token is set (via /connect or AWS_BEARER_TOKEN_BEDROCK), it takes precedence over all AWS credential methods including configured profiles.

Run the /models command to select the model you want.

For custom inference profiles, use the model and provider name in the key and set the id property to the arn. This ensures correct caching:

We recommend signing up for Claude Pro or Max.

We’ve received reports of some users having their subscriptions blocked while using it with OpenCode.

Once you’ve signed up, run the /connect command and select Anthropic.

Here you can select the Claude Pro/Max option and it’ll open your browser and ask you to authenticate.

Now all the Anthropic models should be available when you use the /models command.

You can also select Create an API Key if you don’t have a Pro/Max subscription. It’ll also open your browser and ask you to login to Anthropic and give you a code you can paste in your terminal.

Or if you already have an API key, you can select Manually enter API Key and paste it in your terminal.

If you encounter “I’m sorry, but I cannot assist with that request” errors, try changing the content filter from DefaultV2 to Default in your Azure resource.

Head over to the Azure portal and create an Azure OpenAI resource. You’ll need:

Go to Azure AI Foundry and deploy a model.

The deployment name must match the model name for opencode to work properly.

Run the /connect command and search for Azure.

Set your resource name as an environment variable:

Or add it to your bash profile:

Run the /models command to select your deployed model.

Head over to the Azure portal and create an Azure OpenAI resource. You’ll need:

Go to Azure AI Foundry and deploy a model.

The deployment name must match the model name for opencode to work properly.

Run the /connect command and search for Azure Cognitive Services.

Set your resource name as an environment variable:

Or add it to your bash profile:

Run the /models command to select your deployed model.

Head over to the Baseten, create an account, and generate an API key.

Run the /connect command and search for Baseten.

Enter your Baseten API key.

Run the /models command to select a model.

Head over to the Cerebras console, create an account, and generate an API key.

Run the /connect command and search for Cerebras.

Enter your Cerebras API key.

Run the /models command to select a model like Qwen 3 Coder 480B.

Cloudflare AI Gateway lets you access models from OpenAI, Anthropic, Workers AI, and more through a unified endpoint. With Unified Billing you don’t need separate API keys for each provider.

Head over to the Cloudflare dashboard, navigate to AI > AI Gateway, and create a new gateway.

Set your Account ID and Gateway ID as environment variables.

Run the /connect command and search for Cloudflare AI Gateway.

Enter your Cloudflare API token.

Or set it as an environment variable.

Run the /models command to select a model.

You can also add models through your opencode config.

Head over to the Cortecs console, create an account, and generate an API key.

Run the /connect command and search for Cortecs.

Enter your Cortecs API key.

Run the /models command to select a model like Kimi K2 Instruct.

Head over to the DeepSeek console, create an account, and click Create new API key.

Run the /connect command and search for DeepSeek.

Enter your DeepSeek API key.

Run the /models command to select a DeepSeek model like DeepSeek Reasoner.

Head over to the Deep Infra dashboard, create an account, and generate an API key.

Run the /connect command and search for Deep Infra.

Enter your Deep Infra API key.

Run the /models command to select a model.

Head over to the Firmware dashboard, create an account, and generate an API key.

Run the /connect command and search for Firmware.

Enter your Firmware API key.

Run the /models command to select a model.

Head over to the Fireworks AI console, create an account, and click Create API Key.

Run the /connect command and search for Fireworks AI.

Enter your Fireworks AI API key.

Run the /models command to select a model like Kimi K2 Instruct.

GitLab Duo provides AI-powered agentic chat with native tool calling capabilities through GitLab’s Anthropic proxy.

Run the /connect command and select GitLab.

Choose your authentication method:

Select OAuth and your browser will open for authorization.

Run the /models command to see available models.

Three Claude-based models are available:

You can also specify ‘GITLAB_TOKEN’ environment variable if you don’t want to store token in opencode auth storage.

OpenCode uses a small model for some AI tasks like generating the session title. It is configured to use gpt-5-nano by default, hosted by Zen. To lock OpenCode to only use your own GitLab-hosted instance, add the following to your opencode.json file. It is also recommended to disable session sharing.

For self-hosted GitLab instances:

If your instance runs a custom AI Gateway:

Or add to your bash profile:

Your GitLab administrator must enable the following:

In order to make Oauth working for your self-hosted instance, you need to create a new application (Settings → Applications) with the callback URL http://127.0.0.1:8080/callback and following scopes:

Then expose application ID as environment variable:

More documentation on opencode-gitlab-auth homepage.

Customize through opencode.json:

To access GitLab tools (merge requests, issues, pipelines, CI/CD, etc.):

This plugin provides comprehensive GitLab repository management capabilities including MR reviews, issue tracking, pipeline monitoring, and more.

To use your GitHub Copilot subscription with opencode:

Some models might need a Pro+ subscription to use.

Some models need to be manually enabled in your GitHub Copilot settings.

Run the /connect command and search for GitHub Copilot.

Navigate to github.com/login/device and enter the code.

Now run the /models command to select the model you want.

To use Google Vertex AI with OpenCode:

Head over to the Model Garden in the Google Cloud Console and check the models available in your region.

You need to have a Google Cloud project with Vertex AI API enabled.

Set the required environment variables:

Set them while running opencode.

Or add them to your bash profile.

The global region improves availability and reduces errors at no extra cost. Use regional endpoints (e.g., us-central1) for data residency requirements. Learn more

Run the /models command to select the model you want.

Head over to the Groq console, click Create API Key, and copy the key.

Run the /connect command and search for Groq.

Enter the API key for the provider.

Run the /models command to select the one you want.

Hugging Face Inference Providers provides access to open models supported by 17+ providers.

Head over to Hugging Face settings to create a token with permission to make calls to Inference Providers.

Run the /connect command and search for Hugging Face.

Enter your Hugging Face token.

Run the /models command to select a model like Kimi-K2-Instruct or GLM-4.6.

Helicone is an LLM observability platform that provides logging, monitoring, and analytics for your AI applications. The Helicone AI Gateway routes your requests to the appropriate provider automatically based on the model.

Head over to Helicone, create an account, and generate an API key from your dashboard.

Run the /connect command and search for Helicone.

Enter your Helicone API key.

Run the /models command to select a model.

For more providers and advanced features like caching and rate limiting, check the Helicone documentation.

In the event you see a feature or model from Helicone that isn’t configured automatically through opencode, you can always configure it yourself.

Here’s Helicone’s Model Directory, you’ll need this to grab the IDs of the models you want to add.

Helicone supports custom headers for features like caching, user tracking, and session management. Add them to your provider config using options.headers:

Helicone’s Sessions feature lets you group related LLM requests together. Use the opencode-helicone-session plugin to automatically log each OpenCode conversation as a session in Helicone.

Add it to your config.

The plugin injects Helicone-Session-Id and Helicone-Session-Name headers into your requests. In Helicone’s Sessions page, you’ll see each OpenCode conversation listed as a separate session.

See the Helicone Header Directory for all available headers.

You can configure opencode to use local models through llama.cpp’s llama-server utility

IO.NET offers 17 models optimized for various use cases:

Head over to the IO.NET console, create an account, and generate an API key.

Run the /connect command and search for IO.NET.

Enter your IO.NET API key.

Run the /models command to select a model.

You can configure opencode to use local models through LM Studio.

To use Kimi K2 from Moonshot AI:

Head over to the Moonshot AI console, create an account, and click Create API key.

Run the /connect command and search for Moonshot AI.

Enter your Moonshot API key.

Run the /models command to select Kimi K2.

Head over to the MiniMax API Console, create an account, and generate an API key.

Run the /connect command and search for MiniMax.

Enter your MiniMax API key.

Run the /models command to select a model like M2.1.

Head over to the Nebius Token Factory console, create an account, and click Add Key.

Run the /connect command and search for Nebius Token Factory.

Enter your Nebius Token Factory API key.

Run the /models command to select a model like Kimi K2 Instruct.

You can configure opencode to use local models through Ollama.

If tool calls aren’t working, try increasing num_ctx in Ollama. Start around 16k - 32k.

To use Ollama Cloud with OpenCode:

Head over to https://ollama.com/ and sign in or create an account.

Navigate to Settings > Keys and click Add API Key to generate a new API key.

Copy the API key for use in OpenCode.

Run the /connect command and search for Ollama Cloud.

Enter your Ollama Cloud API key.

Important: Before using cloud models in OpenCode, you must pull the model information locally:

Run the /models command to select your Ollama Cloud model.

We recommend signing up for ChatGPT Plus or Pro.

Once you’ve signed up, run the /connect command and select OpenAI.

Here you can select the ChatGPT Plus/Pro option and it’ll open your browser and ask you to authenticate.

Now all the OpenAI models should be available when you use the /models command.

If you already have an API key, you can select Manually enter API Key and paste it in your terminal.

OpenCode Zen is a list of tested and verified models provided by the OpenCode team. Learn more.

Sign in to OpenCode Zen and click Create API Key.

Run the /connect command and search for OpenCode Zen.

Enter your OpenCode API key.

Run the /models command to select a model like Qwen 3 Coder 480B.

Head over to the OpenRouter dashboard, click Create API Key, and copy the key.

Run the /connect command and search for OpenRouter.

Enter the API key for the provider.

Many OpenRouter models are preloaded by default, run the /models command to select the one you want.

You can also add additional models through your opencode config.

You can also customize them through your opencode config. Here’s an example of specifying a provider

SAP AI Core provides access to 40+ models from OpenAI, Anthropic, Google, Amazon, Meta, Mistral, and AI21 through a unified platform.

Go to your SAP BTP Cockpit, navigate to your SAP AI Core service instance, and create a service key.

The service key is a JSON object containing clientid, clientsecret, url, and serviceurls.AI_API_URL. You can find your AI Core instance under Services > Instances and Subscriptions in the BTP Cockpit.

Run the /connect command and search for SAP AI Core.

Enter your service key JSON.

Or set the AICORE_SERVICE_KEY environment variable:

Or add it to your bash profile:

Optionally set deployment ID and resource group:

These settings are optional and should be configured according to your SAP AI Core setup.

Run the /models command to select from 40+ available models.

Head over to the OVHcloud panel. Navigate to the Public Cloud section, AI & Machine Learning > AI Endpoints and in API Keys tab, click Create a new API key.

Run the /connect command and search for OVHcloud AI Endpoints.

Enter your OVHcloud AI Endpoints API key.

Run the /models command to select a model like gpt-oss-120b.

To use Scaleway Generative APIs with Opencode:

Head over to the Scaleway Console IAM settings to generate a new API key.

Run the /connect command and search for Scaleway.

Enter your Scaleway API key.

Run the /models command to select a model like devstral-2-123b-instruct-2512 or gpt-oss-120b.

Head over to the Together AI console, create an account, and click Add Key.

Run the /connect command and search for Together AI.

Enter your Together AI API key.

Run the /models command to select a model like Kimi K2 Instruct.

Head over to the Venice AI console, create an account, and generate an API key.

Run the /connect command and search for Venice AI.

Enter your Venice AI API key.

Run the /models command to select a model like Llama 3.3 70B.

Vercel AI Gateway lets you access models from OpenAI, Anthropic, Google, xAI, and more through a unified endpoint. Models are offered at list price with no markup.

Head over to the Vercel dashboard, navigate to the AI Gateway tab, and click API keys to create a new API key.

Run the /connect command and search for Vercel AI Gateway.

Enter your Vercel AI Gateway API key.

Run the /models command to select a model.

You can also customize models through your opencode config. Here’s an example of specifying provider routing order.

Some useful routing options:

Head over to the xAI console, create an account, and generate an API key.

Run the /connect command and search for xAI.

Enter your xAI API key.

Run the /models command to select a model like Grok Beta.

Head over to the Z.AI API console, create an account, and click Create a new API key.

Run the /connect command and search for Z.AI.

If you are subscribed to the GLM Coding Plan, select Z.AI Coding Plan.

Enter your Z.AI API key.

Run the /models command to select a model like GLM-4.7.

Head over to the ZenMux dashboard, click Create API Key, and copy the key.

Run the /connect command and search for ZenMux.

Enter the API key for the provider.

Many ZenMux models are preloaded by default, run the /models command to select the one you want.

You can also add additional models through your opencode config.

To add any OpenAI-compatible provider that’s not listed in the /connect command:

You can use any OpenAI-compatible provider with opencode. Most modern AI providers offer OpenAI-compatible APIs.

Run the /connect command and scroll down to Other.

Enter a unique ID for the provider.

Choose a memorable ID, you’ll use this in your config file.

Enter your API key for the provider.

Create or update your opencode.json file in your project directory:

Here are the configuration options:

More on the advanced options in the example below.

Run the /models command and your custom provider and models will appear in the selection list.

Here’s an example setting the apiKey, headers, and model limit options.

Configuration details:

The limit fields allow OpenCode to understand how much context you have left. Standard providers pull these from models.dev automatically.

If you are having trouble with configuring a provider, check the following:

Check the auth setup: Run opencode auth list to see if the credentials for the provider are added to your config.

This doesn’t apply to providers like Amazon Bedrock, that rely on environment variables for their auth.

For custom providers, check the opencode config and:

**Examples:**

Example 1 (unknown):
```unknown
~/.local/share/opencode/auth.json
```

Example 2 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "provider": {    "anthropic": {      "options": {        "baseURL": "https://api.anthropic.com/v1"      }    }  }}
```

Example 3 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "provider": {    "anthropic": {      "options": {        "baseURL": "https://api.anthropic.com/v1"      }    }  }}
```

Example 4 (unknown):
```unknown
┌ API key││└ enter
```

---

## Models | OpenCode

**URL:** https://opencode.ai/docs/models/

**Contents:**
- Models
- Providers
- Select a model
- Recommended models
- Set a default
- Configure models
- Variants
  - Built-in variants
  - Custom variants
  - Cycle variants

Configuring an LLM provider and model.

OpenCode uses the AI SDK and Models.dev to support 75+ LLM providers and it supports running local models.

Most popular providers are preloaded by default. If you’ve added the credentials for a provider through the /connect command, they’ll be available when you start OpenCode.

Learn more about providers.

Once you’ve configured your provider you can select the model you want by typing in:

There are a lot of models out there, with new models coming out every week.

Consider using one of the models we recommend.

However, there are only a few of them that are good at both generating code and tool calling.

Here are several models that work well with OpenCode, in no particular order. (This is not an exhaustive list nor is it necessarily up to date):

To set one of these as the default model, you can set the model key in your OpenCode config.

Here the full ID is provider_id/model_id. For example, if you’re using OpenCode Zen, you would use opencode/gpt-5.1-codex for GPT 5.1 Codex.

If you’ve configured a custom provider, the provider_id is key from the provider part of your config, and the model_id is the key from provider.models.

You can globally configure a model’s options through the config.

Here we’re configuring global settings for two built-in models: gpt-5 when accessed via the openai provider, and claude-sonnet-4-20250514 when accessed via the anthropic provider. The built-in provider and model names can be found on Models.dev.

You can also configure these options for any agents that you are using. The agent config overrides any global options here. Learn more.

You can also define custom variants that extend built-in ones. Variants let you configure different settings for the same model without creating duplicate entries:

Many models support multiple variants with different configurations. OpenCode ships with built-in default variants for popular providers.

OpenCode ships with default variants for many providers:

Varies by model but roughly:

This list is not comprehensive. Many other providers have built-in defaults too.

You can override existing variants or add your own:

Use the keybind variant_cycle to quickly switch between variants. Learn more.

When OpenCode starts up, it checks for models in the following priority order:

The --model or -m command line flag. The format is the same as in the config file: provider_id/model_id.

The model list in the OpenCode config.

The format here is provider/model.

The first model using an internal priority.

**Examples:**

Example 1 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "model": "lmstudio/google/gemma-3n-e4b"}
```

Example 2 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "model": "lmstudio/google/gemma-3n-e4b"}
```

Example 3 (unknown):
```unknown
provider_id/model_id
```

Example 4 (unknown):
```unknown
opencode/gpt-5.1-codex
```

---

## Zen | OpenCode

**URL:** https://opencode.ai/docs/zen

**Contents:**
- Zen
- Background
- How it works
- Endpoints
  - Models
- Pricing
  - Auto-reload
  - Monthly limits
- Privacy
- For Teams

Curated list of models provided by OpenCode.

OpenCode Zen is a list of tested and verified models provided by the OpenCode team.

OpenCode Zen is currently in beta.

Zen works like any other provider in OpenCode. You login to OpenCode Zen and get your API key. It’s completely optional and you don’t need to use it to use OpenCode.

There are a large number of models out there but only a few of these models work well as coding agents. Additionally, most providers are configured very differently; so you get very different performance and quality.

We tested a select group of models and providers that work well with OpenCode.

So if you are using a model through something like OpenRouter, you can never be sure if you are getting the best version of the model you want.

To fix this, we did a couple of things:

OpenCode Zen is an AI gateway that gives you access to these models.

OpenCode Zen works like any other provider in OpenCode.

You are charged per request and you can add credits to your account.

You can also access our models through the following API endpoints.

The model id in your OpenCode config uses the format opencode/<model-id>. For example, for GPT 5.2 Codex, you would use opencode/gpt-5.2-codex in your config.

You can fetch the full list of available models and their metadata from:

We support a pay-as-you-go model. Below are the prices per 1M tokens.

You might notice Claude Haiku 3.5 in your usage history. This is a low cost model that’s used to generate the titles of your sessions.

Credit card fees are passed along at cost (4.4% + $0.30 per transaction); we don’t charge anything beyond that.

Contact us if you have any questions.

If your balance goes below $5, Zen will automatically reload $20.

You can change the auto-reload amount. You can also disable auto-reload entirely.

You can also set a monthly usage limit for the entire workspace and for each member of your team.

For example, let’s say you set a monthly usage limit to $20, Zen will not use more than $20 in a month. But if you have auto-reload enabled, Zen might end up charging you more than $20 if your balance goes below $5.

All our models are hosted in the US. Our providers follow a zero-retention policy and do not use your data for model training, with the following exceptions:

Zen also works great for teams. You can invite teammates, assign roles, curate the models your team uses, and more.

Workspaces are currently free for teams as a part of the beta.

Managing your workspace is currently free for teams as a part of the beta. We’ll be sharing more details on the pricing soon.

You can invite teammates to your workspace and assign roles:

Admins can also set monthly spending limits for each member to keep costs under control.

Admins can enable or disable specific models for the workspace. Requests made to a disabled model will return an error.

This is useful for cases where you want to disable the use of a model that collects data.

You can use your own OpenAI or Anthropic API keys while still accessing other models in Zen.

When you use your own keys, tokens are billed directly by the provider, not by Zen.

For example, your organization might already have a key for OpenAI or Anthropic and you want to use that instead of the one that Zen provides.

We created OpenCode Zen to:

**Examples:**

Example 1 (yaml):
```yaml
https://opencode.ai/zen/v1/responses
```

Example 2 (python):
```python
@ai-sdk/openai
```

Example 3 (yaml):
```yaml
https://opencode.ai/zen/v1/responses
```

Example 4 (python):
```python
@ai-sdk/openai
```

---

## Zen | OpenCode

**URL:** https://opencode.ai/docs/zen/

**Contents:**
- Zen
- Background
- How it works
- Endpoints
  - Models
- Pricing
  - Auto-reload
  - Monthly limits
- Privacy
- For Teams

Curated list of models provided by OpenCode.

OpenCode Zen is a list of tested and verified models provided by the OpenCode team.

OpenCode Zen is currently in beta.

Zen works like any other provider in OpenCode. You login to OpenCode Zen and get your API key. It’s completely optional and you don’t need to use it to use OpenCode.

There are a large number of models out there but only a few of these models work well as coding agents. Additionally, most providers are configured very differently; so you get very different performance and quality.

We tested a select group of models and providers that work well with OpenCode.

So if you are using a model through something like OpenRouter, you can never be sure if you are getting the best version of the model you want.

To fix this, we did a couple of things:

OpenCode Zen is an AI gateway that gives you access to these models.

OpenCode Zen works like any other provider in OpenCode.

You are charged per request and you can add credits to your account.

You can also access our models through the following API endpoints.

The model id in your OpenCode config uses the format opencode/<model-id>. For example, for GPT 5.2 Codex, you would use opencode/gpt-5.2-codex in your config.

You can fetch the full list of available models and their metadata from:

We support a pay-as-you-go model. Below are the prices per 1M tokens.

You might notice Claude Haiku 3.5 in your usage history. This is a low cost model that’s used to generate the titles of your sessions.

Credit card fees are passed along at cost (4.4% + $0.30 per transaction); we don’t charge anything beyond that.

Contact us if you have any questions.

If your balance goes below $5, Zen will automatically reload $20.

You can change the auto-reload amount. You can also disable auto-reload entirely.

You can also set a monthly usage limit for the entire workspace and for each member of your team.

For example, let’s say you set a monthly usage limit to $20, Zen will not use more than $20 in a month. But if you have auto-reload enabled, Zen might end up charging you more than $20 if your balance goes below $5.

All our models are hosted in the US. Our providers follow a zero-retention policy and do not use your data for model training, with the following exceptions:

Zen also works great for teams. You can invite teammates, assign roles, curate the models your team uses, and more.

Workspaces are currently free for teams as a part of the beta.

Managing your workspace is currently free for teams as a part of the beta. We’ll be sharing more details on the pricing soon.

You can invite teammates to your workspace and assign roles:

Admins can also set monthly spending limits for each member to keep costs under control.

Admins can enable or disable specific models for the workspace. Requests made to a disabled model will return an error.

This is useful for cases where you want to disable the use of a model that collects data.

You can use your own OpenAI or Anthropic API keys while still accessing other models in Zen.

When you use your own keys, tokens are billed directly by the provider, not by Zen.

For example, your organization might already have a key for OpenAI or Anthropic and you want to use that instead of the one that Zen provides.

We created OpenCode Zen to:

**Examples:**

Example 1 (yaml):
```yaml
https://opencode.ai/zen/v1/responses
```

Example 2 (python):
```python
@ai-sdk/openai
```

Example 3 (yaml):
```yaml
https://opencode.ai/zen/v1/responses
```

Example 4 (python):
```python
@ai-sdk/openai
```

---

## Providers | OpenCode

**URL:** https://opencode.ai/docs/providers

**Contents:**
- Providers
  - Credentials
  - Config
    - Base URL
- OpenCode Zen
- Directory
  - 302.AI
  - Amazon Bedrock
    - Environment Variables (Quick Start)
    - Configuration File (Recommended)

Using any LLM provider in OpenCode.

OpenCode uses the AI SDK and Models.dev to support 75+ LLM providers and it supports running local models.

To add a provider you need to:

When you add a provider’s API keys with the /connect command, they are stored in ~/.local/share/opencode/auth.json.

You can customize the providers through the provider section in your OpenCode config.

You can customize the base URL for any provider by setting the baseURL option. This is useful when using proxy services or custom endpoints.

OpenCode Zen is a list of models provided by the OpenCode team that have been tested and verified to work well with OpenCode. Learn more.

If you are new, we recommend starting with OpenCode Zen.

Run the /connect command in the TUI, select opencode, and head to opencode.ai/auth.

Sign in, add your billing details, and copy your API key.

Run /models in the TUI to see the list of models we recommend.

It works like any other provider in OpenCode and is completely optional to use.

Let’s look at some of the providers in detail. If you’d like to add a provider to the list, feel free to open a PR.

Don’t see a provider here? Submit a PR.

Head over to the 302.AI console, create an account, and generate an API key.

Run the /connect command and search for 302.AI.

Enter your 302.AI API key.

Run the /models command to select a model.

To use Amazon Bedrock with OpenCode:

Head over to the Model catalog in the Amazon Bedrock console and request access to the models you want.

You need to have access to the model you want in Amazon Bedrock.

Configure authentication using one of the following methods:

Set one of these environment variables while running opencode:

Or add them to your bash profile:

For project-specific or persistent configuration, use opencode.json:

Configuration file options take precedence over environment variables.

If you’re using VPC endpoints for Bedrock:

The endpoint option is an alias for the generic baseURL option, using AWS-specific terminology. If both endpoint and baseURL are specified, endpoint takes precedence.

Amazon Bedrock uses the following authentication priority:

When a bearer token is set (via /connect or AWS_BEARER_TOKEN_BEDROCK), it takes precedence over all AWS credential methods including configured profiles.

Run the /models command to select the model you want.

For custom inference profiles, use the model and provider name in the key and set the id property to the arn. This ensures correct caching:

We recommend signing up for Claude Pro or Max.

We’ve received reports of some users having their subscriptions blocked while using it with OpenCode.

Once you’ve signed up, run the /connect command and select Anthropic.

Here you can select the Claude Pro/Max option and it’ll open your browser and ask you to authenticate.

Now all the Anthropic models should be available when you use the /models command.

You can also select Create an API Key if you don’t have a Pro/Max subscription. It’ll also open your browser and ask you to login to Anthropic and give you a code you can paste in your terminal.

Or if you already have an API key, you can select Manually enter API Key and paste it in your terminal.

If you encounter “I’m sorry, but I cannot assist with that request” errors, try changing the content filter from DefaultV2 to Default in your Azure resource.

Head over to the Azure portal and create an Azure OpenAI resource. You’ll need:

Go to Azure AI Foundry and deploy a model.

The deployment name must match the model name for opencode to work properly.

Run the /connect command and search for Azure.

Set your resource name as an environment variable:

Or add it to your bash profile:

Run the /models command to select your deployed model.

Head over to the Azure portal and create an Azure OpenAI resource. You’ll need:

Go to Azure AI Foundry and deploy a model.

The deployment name must match the model name for opencode to work properly.

Run the /connect command and search for Azure Cognitive Services.

Set your resource name as an environment variable:

Or add it to your bash profile:

Run the /models command to select your deployed model.

Head over to the Baseten, create an account, and generate an API key.

Run the /connect command and search for Baseten.

Enter your Baseten API key.

Run the /models command to select a model.

Head over to the Cerebras console, create an account, and generate an API key.

Run the /connect command and search for Cerebras.

Enter your Cerebras API key.

Run the /models command to select a model like Qwen 3 Coder 480B.

Cloudflare AI Gateway lets you access models from OpenAI, Anthropic, Workers AI, and more through a unified endpoint. With Unified Billing you don’t need separate API keys for each provider.

Head over to the Cloudflare dashboard, navigate to AI > AI Gateway, and create a new gateway.

Set your Account ID and Gateway ID as environment variables.

Run the /connect command and search for Cloudflare AI Gateway.

Enter your Cloudflare API token.

Or set it as an environment variable.

Run the /models command to select a model.

You can also add models through your opencode config.

Head over to the Cortecs console, create an account, and generate an API key.

Run the /connect command and search for Cortecs.

Enter your Cortecs API key.

Run the /models command to select a model like Kimi K2 Instruct.

Head over to the DeepSeek console, create an account, and click Create new API key.

Run the /connect command and search for DeepSeek.

Enter your DeepSeek API key.

Run the /models command to select a DeepSeek model like DeepSeek Reasoner.

Head over to the Deep Infra dashboard, create an account, and generate an API key.

Run the /connect command and search for Deep Infra.

Enter your Deep Infra API key.

Run the /models command to select a model.

Head over to the Firmware dashboard, create an account, and generate an API key.

Run the /connect command and search for Firmware.

Enter your Firmware API key.

Run the /models command to select a model.

Head over to the Fireworks AI console, create an account, and click Create API Key.

Run the /connect command and search for Fireworks AI.

Enter your Fireworks AI API key.

Run the /models command to select a model like Kimi K2 Instruct.

GitLab Duo provides AI-powered agentic chat with native tool calling capabilities through GitLab’s Anthropic proxy.

Run the /connect command and select GitLab.

Choose your authentication method:

Select OAuth and your browser will open for authorization.

Run the /models command to see available models.

Three Claude-based models are available:

You can also specify ‘GITLAB_TOKEN’ environment variable if you don’t want to store token in opencode auth storage.

OpenCode uses a small model for some AI tasks like generating the session title. It is configured to use gpt-5-nano by default, hosted by Zen. To lock OpenCode to only use your own GitLab-hosted instance, add the following to your opencode.json file. It is also recommended to disable session sharing.

For self-hosted GitLab instances:

If your instance runs a custom AI Gateway:

Or add to your bash profile:

Your GitLab administrator must enable the following:

In order to make Oauth working for your self-hosted instance, you need to create a new application (Settings → Applications) with the callback URL http://127.0.0.1:8080/callback and following scopes:

Then expose application ID as environment variable:

More documentation on opencode-gitlab-auth homepage.

Customize through opencode.json:

To access GitLab tools (merge requests, issues, pipelines, CI/CD, etc.):

This plugin provides comprehensive GitLab repository management capabilities including MR reviews, issue tracking, pipeline monitoring, and more.

To use your GitHub Copilot subscription with opencode:

Some models might need a Pro+ subscription to use.

Some models need to be manually enabled in your GitHub Copilot settings.

Run the /connect command and search for GitHub Copilot.

Navigate to github.com/login/device and enter the code.

Now run the /models command to select the model you want.

To use Google Vertex AI with OpenCode:

Head over to the Model Garden in the Google Cloud Console and check the models available in your region.

You need to have a Google Cloud project with Vertex AI API enabled.

Set the required environment variables:

Set them while running opencode.

Or add them to your bash profile.

The global region improves availability and reduces errors at no extra cost. Use regional endpoints (e.g., us-central1) for data residency requirements. Learn more

Run the /models command to select the model you want.

Head over to the Groq console, click Create API Key, and copy the key.

Run the /connect command and search for Groq.

Enter the API key for the provider.

Run the /models command to select the one you want.

Hugging Face Inference Providers provides access to open models supported by 17+ providers.

Head over to Hugging Face settings to create a token with permission to make calls to Inference Providers.

Run the /connect command and search for Hugging Face.

Enter your Hugging Face token.

Run the /models command to select a model like Kimi-K2-Instruct or GLM-4.6.

Helicone is an LLM observability platform that provides logging, monitoring, and analytics for your AI applications. The Helicone AI Gateway routes your requests to the appropriate provider automatically based on the model.

Head over to Helicone, create an account, and generate an API key from your dashboard.

Run the /connect command and search for Helicone.

Enter your Helicone API key.

Run the /models command to select a model.

For more providers and advanced features like caching and rate limiting, check the Helicone documentation.

In the event you see a feature or model from Helicone that isn’t configured automatically through opencode, you can always configure it yourself.

Here’s Helicone’s Model Directory, you’ll need this to grab the IDs of the models you want to add.

Helicone supports custom headers for features like caching, user tracking, and session management. Add them to your provider config using options.headers:

Helicone’s Sessions feature lets you group related LLM requests together. Use the opencode-helicone-session plugin to automatically log each OpenCode conversation as a session in Helicone.

Add it to your config.

The plugin injects Helicone-Session-Id and Helicone-Session-Name headers into your requests. In Helicone’s Sessions page, you’ll see each OpenCode conversation listed as a separate session.

See the Helicone Header Directory for all available headers.

You can configure opencode to use local models through llama.cpp’s llama-server utility

IO.NET offers 17 models optimized for various use cases:

Head over to the IO.NET console, create an account, and generate an API key.

Run the /connect command and search for IO.NET.

Enter your IO.NET API key.

Run the /models command to select a model.

You can configure opencode to use local models through LM Studio.

To use Kimi K2 from Moonshot AI:

Head over to the Moonshot AI console, create an account, and click Create API key.

Run the /connect command and search for Moonshot AI.

Enter your Moonshot API key.

Run the /models command to select Kimi K2.

Head over to the MiniMax API Console, create an account, and generate an API key.

Run the /connect command and search for MiniMax.

Enter your MiniMax API key.

Run the /models command to select a model like M2.1.

Head over to the Nebius Token Factory console, create an account, and click Add Key.

Run the /connect command and search for Nebius Token Factory.

Enter your Nebius Token Factory API key.

Run the /models command to select a model like Kimi K2 Instruct.

You can configure opencode to use local models through Ollama.

If tool calls aren’t working, try increasing num_ctx in Ollama. Start around 16k - 32k.

To use Ollama Cloud with OpenCode:

Head over to https://ollama.com/ and sign in or create an account.

Navigate to Settings > Keys and click Add API Key to generate a new API key.

Copy the API key for use in OpenCode.

Run the /connect command and search for Ollama Cloud.

Enter your Ollama Cloud API key.

Important: Before using cloud models in OpenCode, you must pull the model information locally:

Run the /models command to select your Ollama Cloud model.

We recommend signing up for ChatGPT Plus or Pro.

Once you’ve signed up, run the /connect command and select OpenAI.

Here you can select the ChatGPT Plus/Pro option and it’ll open your browser and ask you to authenticate.

Now all the OpenAI models should be available when you use the /models command.

If you already have an API key, you can select Manually enter API Key and paste it in your terminal.

OpenCode Zen is a list of tested and verified models provided by the OpenCode team. Learn more.

Sign in to OpenCode Zen and click Create API Key.

Run the /connect command and search for OpenCode Zen.

Enter your OpenCode API key.

Run the /models command to select a model like Qwen 3 Coder 480B.

Head over to the OpenRouter dashboard, click Create API Key, and copy the key.

Run the /connect command and search for OpenRouter.

Enter the API key for the provider.

Many OpenRouter models are preloaded by default, run the /models command to select the one you want.

You can also add additional models through your opencode config.

You can also customize them through your opencode config. Here’s an example of specifying a provider

SAP AI Core provides access to 40+ models from OpenAI, Anthropic, Google, Amazon, Meta, Mistral, and AI21 through a unified platform.

Go to your SAP BTP Cockpit, navigate to your SAP AI Core service instance, and create a service key.

The service key is a JSON object containing clientid, clientsecret, url, and serviceurls.AI_API_URL. You can find your AI Core instance under Services > Instances and Subscriptions in the BTP Cockpit.

Run the /connect command and search for SAP AI Core.

Enter your service key JSON.

Or set the AICORE_SERVICE_KEY environment variable:

Or add it to your bash profile:

Optionally set deployment ID and resource group:

These settings are optional and should be configured according to your SAP AI Core setup.

Run the /models command to select from 40+ available models.

Head over to the OVHcloud panel. Navigate to the Public Cloud section, AI & Machine Learning > AI Endpoints and in API Keys tab, click Create a new API key.

Run the /connect command and search for OVHcloud AI Endpoints.

Enter your OVHcloud AI Endpoints API key.

Run the /models command to select a model like gpt-oss-120b.

To use Scaleway Generative APIs with Opencode:

Head over to the Scaleway Console IAM settings to generate a new API key.

Run the /connect command and search for Scaleway.

Enter your Scaleway API key.

Run the /models command to select a model like devstral-2-123b-instruct-2512 or gpt-oss-120b.

Head over to the Together AI console, create an account, and click Add Key.

Run the /connect command and search for Together AI.

Enter your Together AI API key.

Run the /models command to select a model like Kimi K2 Instruct.

Head over to the Venice AI console, create an account, and generate an API key.

Run the /connect command and search for Venice AI.

Enter your Venice AI API key.

Run the /models command to select a model like Llama 3.3 70B.

Vercel AI Gateway lets you access models from OpenAI, Anthropic, Google, xAI, and more through a unified endpoint. Models are offered at list price with no markup.

Head over to the Vercel dashboard, navigate to the AI Gateway tab, and click API keys to create a new API key.

Run the /connect command and search for Vercel AI Gateway.

Enter your Vercel AI Gateway API key.

Run the /models command to select a model.

You can also customize models through your opencode config. Here’s an example of specifying provider routing order.

Some useful routing options:

Head over to the xAI console, create an account, and generate an API key.

Run the /connect command and search for xAI.

Enter your xAI API key.

Run the /models command to select a model like Grok Beta.

Head over to the Z.AI API console, create an account, and click Create a new API key.

Run the /connect command and search for Z.AI.

If you are subscribed to the GLM Coding Plan, select Z.AI Coding Plan.

Enter your Z.AI API key.

Run the /models command to select a model like GLM-4.7.

Head over to the ZenMux dashboard, click Create API Key, and copy the key.

Run the /connect command and search for ZenMux.

Enter the API key for the provider.

Many ZenMux models are preloaded by default, run the /models command to select the one you want.

You can also add additional models through your opencode config.

To add any OpenAI-compatible provider that’s not listed in the /connect command:

You can use any OpenAI-compatible provider with opencode. Most modern AI providers offer OpenAI-compatible APIs.

Run the /connect command and scroll down to Other.

Enter a unique ID for the provider.

Choose a memorable ID, you’ll use this in your config file.

Enter your API key for the provider.

Create or update your opencode.json file in your project directory:

Here are the configuration options:

More on the advanced options in the example below.

Run the /models command and your custom provider and models will appear in the selection list.

Here’s an example setting the apiKey, headers, and model limit options.

Configuration details:

The limit fields allow OpenCode to understand how much context you have left. Standard providers pull these from models.dev automatically.

If you are having trouble with configuring a provider, check the following:

Check the auth setup: Run opencode auth list to see if the credentials for the provider are added to your config.

This doesn’t apply to providers like Amazon Bedrock, that rely on environment variables for their auth.

For custom providers, check the opencode config and:

**Examples:**

Example 1 (unknown):
```unknown
~/.local/share/opencode/auth.json
```

Example 2 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "provider": {    "anthropic": {      "options": {        "baseURL": "https://api.anthropic.com/v1"      }    }  }}
```

Example 3 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "provider": {    "anthropic": {      "options": {        "baseURL": "https://api.anthropic.com/v1"      }    }  }}
```

Example 4 (unknown):
```unknown
┌ API key││└ enter
```

---
