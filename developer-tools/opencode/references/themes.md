# Opencode - Themes

**Pages:** 2

---

## Themes | OpenCode

**URL:** https://opencode.ai/docs/themes

**Contents:**
- Themes
- Terminal requirements
- Built-in themes
- System theme
- Using a theme
- Custom themes
  - Hierarchy
  - Creating a theme
  - JSON format
  - Color definitions

Select a built-in theme or define your own.

With OpenCode you can select from one of several built-in themes, use a theme that adapts to your terminal theme, or define your own custom theme.

By default, OpenCode uses our own opencode theme.

For themes to display correctly with their full color palette, your terminal must support truecolor (24-bit color). Most modern terminals support this by default, but you may need to enable it:

Without truecolor support, themes may appear with reduced color accuracy or fall back to the nearest 256-color approximation.

OpenCode comes with several built-in themes.

And more, we are constantly adding new themes.

The system theme is designed to automatically adapt to your terminal’s color scheme. Unlike traditional themes that use fixed colors, the system theme:

The system theme is for users who:

You can select a theme by bringing up the theme select with the /theme command. Or you can specify it in your config.

OpenCode supports a flexible JSON-based theme system that allows users to create and customize themes easily.

Themes are loaded from multiple directories in the following order where later directories override earlier ones:

If multiple directories contain a theme with the same name, the theme from the directory with higher priority will be used.

To create a custom theme, create a JSON file in one of the theme directories.

For user-wide themes:

And for project-specific themes.

Themes use a flexible JSON format with support for:

The defs section is optional and it allows you to define reusable colors that can be referenced in the theme.

The special value "none" can be used for any color to inherit the terminal’s default color. This is particularly useful for creating themes that blend seamlessly with your terminal’s color scheme:

Here’s an example of a custom theme:

**Examples:**

Example 1 (bash):
```bash
echo $COLORTERM
```

Example 2 (unknown):
```unknown
COLORTERM=truecolor
```

Example 3 (unknown):
```unknown
catppuccin-macchiato
```

Example 4 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "theme": "tokyonight"}
```

---

## Themes | OpenCode

**URL:** https://opencode.ai/docs/themes/

**Contents:**
- Themes
- Terminal requirements
- Built-in themes
- System theme
- Using a theme
- Custom themes
  - Hierarchy
  - Creating a theme
  - JSON format
  - Color definitions

Select a built-in theme or define your own.

With OpenCode you can select from one of several built-in themes, use a theme that adapts to your terminal theme, or define your own custom theme.

By default, OpenCode uses our own opencode theme.

For themes to display correctly with their full color palette, your terminal must support truecolor (24-bit color). Most modern terminals support this by default, but you may need to enable it:

Without truecolor support, themes may appear with reduced color accuracy or fall back to the nearest 256-color approximation.

OpenCode comes with several built-in themes.

And more, we are constantly adding new themes.

The system theme is designed to automatically adapt to your terminal’s color scheme. Unlike traditional themes that use fixed colors, the system theme:

The system theme is for users who:

You can select a theme by bringing up the theme select with the /theme command. Or you can specify it in your config.

OpenCode supports a flexible JSON-based theme system that allows users to create and customize themes easily.

Themes are loaded from multiple directories in the following order where later directories override earlier ones:

If multiple directories contain a theme with the same name, the theme from the directory with higher priority will be used.

To create a custom theme, create a JSON file in one of the theme directories.

For user-wide themes:

And for project-specific themes.

Themes use a flexible JSON format with support for:

The defs section is optional and it allows you to define reusable colors that can be referenced in the theme.

The special value "none" can be used for any color to inherit the terminal’s default color. This is particularly useful for creating themes that blend seamlessly with your terminal’s color scheme:

Here’s an example of a custom theme:

**Examples:**

Example 1 (bash):
```bash
echo $COLORTERM
```

Example 2 (unknown):
```unknown
COLORTERM=truecolor
```

Example 3 (unknown):
```unknown
catppuccin-macchiato
```

Example 4 (json):
```json
{  "$schema": "https://opencode.ai/config.json",  "theme": "tokyonight"}
```

---
