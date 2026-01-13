---
name: hbuilderx
description: This skill should be used when the user asks to "use HBuilderX", "develop with HBuilderX", "install HBuilderX", "HBuilderX plugin development", "HBuilderX API", "configure HBuilderX", "HBuilderX extension", or needs guidance on DCloud's lightweight IDE optimized for Vue development, multi-terminal development (App, H5, mini programs), and HBuilderX plugin extensions.
version: 1.0.0
---

# HBuilderX Skill

HBuilderX 是 HTML 首个字母，Builder 是构建者，X 是下一个版本的意思。
HBuilderX 是一款轻量但功能强大的 IDE，专门为 Vue 开发优化，支持多端开发（App、H5、小程序）、插件扩展、Markdown 编写等。

## When to Use This Skill

This skill should be triggered when:
- Working with HBuilderX IDE
- Asking about HBuilderX features or APIs
- Implementing HBuilderX plugin solutions
- Debugging HBuilderX plugin code
- Learning HBuilderX best practices

## Quick Reference

### Common Patterns

**Pattern 1**: HBuilderX plugin development
```javascript
const hx = require('hbuilderx')
```

**Pattern 2**: Register a command
```javascript
hx.commands.registerCommand('extension.firstExtension', () => {
    // Your code here
})
```

**Pattern 3**: Show messages
```javascript
hx.window.showErrorMessage('Error message')
```

## Reference Files

This skill includes comprehensive documentation in `references/`:

- **[api.md](references/api.md)** - HBuilderX Plugin API Reference

Use `view` to read specific reference files when detailed information is needed.

## Working with This Skill

### For Beginners
Start with the official HBuilderX documentation for foundational concepts.

### For Plugin Development
Use the API reference for detailed information about plugin development.

### For Specific Features
Use the appropriate reference file for detailed information.

## Resources

### references/
Organized documentation extracted from official sources:
- Detailed API documentation
- Code examples with language annotations
- Links to original documentation

### scripts/
Add helper scripts here for common automation tasks.

### assets/
Add templates, boilerplate, or example projects here.

## Notes

- This skill was generated from HBuilderX official documentation
- Reference files preserve the structure and examples from source docs
- Code examples include language detection for better syntax highlighting

## Updating

To refresh this skill with updated documentation:
1. Update the config file in Skill_Seekers
2. Re-run the scraper with the same configuration
3. The skill will be rebuilt with the latest information
