---
name: uniCloud
description: This skill should be used when the user asks to "develop with uniCloud", "use uniCloud cloud functions", "implement uniCloud database", "configure uniCloud storage", "build with clientDB", "use uni-id", "set up uni-pay", or needs guidance on DCloud's serverless cloud development platform, cloud functions, cloud database, and cloud storage.
---

# Unicloud Skill

Unicloud 是 dcloud 联合阿里云、腾讯云、支付宝云，为开发者提供的基于 serverless 模式和 js 编程的云开发平台。使用此技能时，涉及 unicloud 云函数、云数据库、云存储、clientdb、云对象、schema2code、uni-id、uni-pay 等开发问题。, generated from official documentation.

## When to Use This Skill

This skill should be triggered when:
- Working with uniCloud
- Asking about uniCloud features or APIs
- Implementing uniCloud solutions
- Debugging uniCloud code
- Learning uniCloud best practices

## Quick Reference

### Common Patterns

*Quick reference patterns will be added as you use the skill.*

### Example Code Patterns

**Example 1** (javascript):
```javascript
// 使用uni-ai计费网关，不指定provider，默认会走minimax
const llmManager = uniCloud.ai.getLLMManager()
```

**Example 2** (javascript):
```javascript
// 使用uni-ai计费网关，不指定provider，默认会走minimax
const llmManager = uniCloud.ai.getLLMManager()
```

**Example 3** (javascript):
```javascript
exports.onWebsocketConnection = function (event, context) {
    console.log("onWebsocketConnection", event, context)
}
```

**Example 4** (javascript):
```javascript
exports.onWebsocketConnection = function (event, context) {
    console.log("onWebsocketConnection", event, context)
}
```

**Example 5** (javascript):
```javascript
const dbCmd = db.command
let res = await db.collection('todo').where(dbCmd.and([
  {
    progress: dbCmd.gt(50)
  },
  {
    tags: 'cloud'
  }
])).get()
```

## Reference Files

This skill includes comprehensive documentation in `references/`:

- **admin.md** - Admin documentation
- **api.md** - Api documentation
- **authentication.md** - Authentication documentation
- **cloud_functions.md** - Cloud Functions documentation
- **cms.md** - Cms documentation
- **database.md** - Database documentation
- **getting_started.md** - Getting Started documentation
- **other.md** - Other documentation
- **payment.md** - Payment documentation
- **security.md** - Security documentation
- **storage.md** - Storage documentation

Use `view` to read specific reference files when detailed information is needed.

## Working with This Skill

### For Beginners
Start with the getting_started or tutorials reference files for foundational concepts.

### For Specific Features
Use the appropriate category reference file (api, guides, etc.) for detailed information.

### For Code Examples
The quick reference section above contains common patterns extracted from the official docs.

## Resources

### references/
Organized documentation extracted from official sources. These files contain:
- Detailed explanations
- Code examples with language annotations
- Links to original documentation
- Table of contents for quick navigation

### scripts/
Add helper scripts here for common automation tasks.

### assets/
Add templates, boilerplate, or example projects here.

## Notes

- This skill was automatically generated from official documentation
- Reference files preserve the structure and examples from source docs
- Code examples include language detection for better syntax highlighting
- Quick reference patterns are extracted from common usage examples in the docs

## Updating

To refresh this skill with updated documentation:
1. Re-run the scraper with the same configuration
2. The skill will be rebuilt with the latest information
