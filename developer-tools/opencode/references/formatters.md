# Opencode - Formatters

**Pages:** 2

---

## Formatters | OpenCode

**URL:** https://opencode.ai/docs/formatters

**Contents:**
- Formatters
- Built-in
- How it works
- Configure
  - Disabling formatters
  - Custom formatters

OpenCode uses language specific formatters.

OpenCode automatically formats files after they are written or edited using language-specific formatters. This ensures that the code that is generated follows the code styles of your project.

OpenCode comes with several built-in formatters for popular languages and frameworks. Below is a list of the formatters, supported file extensions, and commands or config options it needs.

So if your project has prettier in your package.json, OpenCode will automatically use it.

When OpenCode writes or edits a file, it:

This process happens in the background, ensuring your code styles are maintained without any manual steps.

You can customize formatters through the formatter section in your OpenCode config.

Each formatter configuration supports the following:

Let’s look at some examples.

To disable all formatters globally, set formatter to false:

To disable a specific formatter, set disabled to true:

You can override the built-in formatters or add new ones by specifying the command, environment variables, and file extensions:

The $FILE placeholder in the command will be replaced with the path to the file being formatted.

**Examples:**

Example 1 (unknown):
```unknown
package.json
```

Example 2 (unknown):
```unknown
biome.json(c)
```

Example 3 (unknown):
```unknown
.clang-format
```

Example 4 (unknown):
```unknown
htmlbeautifier
```

---

## Formatters | OpenCode

**URL:** https://opencode.ai/docs/formatters/

**Contents:**
- Formatters
- Built-in
- How it works
- Configure
  - Disabling formatters
  - Custom formatters

OpenCode uses language specific formatters.

OpenCode automatically formats files after they are written or edited using language-specific formatters. This ensures that the code that is generated follows the code styles of your project.

OpenCode comes with several built-in formatters for popular languages and frameworks. Below is a list of the formatters, supported file extensions, and commands or config options it needs.

So if your project has prettier in your package.json, OpenCode will automatically use it.

When OpenCode writes or edits a file, it:

This process happens in the background, ensuring your code styles are maintained without any manual steps.

You can customize formatters through the formatter section in your OpenCode config.

Each formatter configuration supports the following:

Let’s look at some examples.

To disable all formatters globally, set formatter to false:

To disable a specific formatter, set disabled to true:

You can override the built-in formatters or add new ones by specifying the command, environment variables, and file extensions:

The $FILE placeholder in the command will be replaced with the path to the file being formatted.

**Examples:**

Example 1 (unknown):
```unknown
package.json
```

Example 2 (unknown):
```unknown
biome.json(c)
```

Example 3 (unknown):
```unknown
.clang-format
```

Example 4 (unknown):
```unknown
htmlbeautifier
```

---
