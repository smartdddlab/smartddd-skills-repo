# Bmad-Method - Llms-Txt

**Pages:** 15

---

## Tech-Spec: User Authentication System

**URL:** llms-txt#tech-spec:-user-authentication-system

**Contents:**
- Overview
  - Problem Statement
  - Solution
  - Scope (In/Out)
- Context for Development
  - Codebase Patterns
  - Files to Reference
  - Technical Decisions
- Implementation Plan
  - Tasks

**Created:** 2025-01-15
**Status:** Ready for Development

### Problem Statement

Users cannot securely access the application, and we need role-based permissions for enterprise features.

Implement OAuth 2.0 authentication with JWT tokens and role-based access control (RBAC).

**In:** Login, logout, password reset, role management
**Out:** Social login, SSO, multi-factor authentication (Phase 2)

## Context for Development

### Codebase Patterns

- Use existing auth middleware pattern in `src/middleware/auth.js`
- Follow service layer pattern from `src/services/`
- JWT secrets managed via environment variables

### Files to Reference

- `src/middleware/auth.js` - Authentication middleware
- `src/models/User.js` - User data model
- `config/database.js` - Database connection

### Technical Decisions

- JWT tokens over sessions for API scalability
- bcrypt for password hashing
- Role-based permissions stored in database

## Implementation Plan

- [ ] Create authentication service
- [ ] Implement login/logout endpoints
- [ ] Add JWT middleware
- [ ] Create role-based permissions
- [ ] Write comprehensive tests

### Acceptance Criteria

- [ ] Given valid credentials, when user logs in, then receive JWT token
- [ ] Given invalid token, when accessing protected route, then return 401
- [ ] Given admin role, when accessing admin endpoint, then allow access

Phase 2 (tech-spec) → Phase 4 (implement)

Phase 1 (optional) → Phase 2 (PRD) → Phase 3 (architecture) → Phase 4 (implement)

Phase 1 → Phase 2 (PRD) → Phase 3 (architecture + extended) → Phase 4 (implement)

PRD: "What to build"
     ↓
Architecture: "How to build it"
     ↓
Agent A reads architecture → implements Epic 1
Agent B reads architecture → implements Epic 2
Agent C reads architecture → implements Epic 3
     ↓
Result: Consistent implementation

Agent 1 implements Epic 1 using REST API
Agent 2 implements Epic 2 using GraphQL
Result: Inconsistent API design, integration nightmare

architecture workflow decides: "Use GraphQL for all APIs"
All agents follow architecture decisions
Result: Consistent implementation, no conflicts

_bmad/
├── core/           # Always present
├── bmm/            # BMad Method (if installed)
├── bmb/            # BMad Builder (if installed)
├── cis/            # Creative Intelligence (if installed)
└── bmgd/           # Game Dev (if installed)

my-workflow/
├── workflow.md              # Entry point and configuration
├── steps/                   # Step files (steps-c/ for create, steps-e/ for edit, steps-v/ for validate)
│   ├── step-01-init.md
│   ├── step-02-profile.md
│   └── step-N-final.md
├── data/                    # Reference materials, CSVs, examples
└── templates/               # Output document templates

brainstorming → research → brief → PRD → UX → architecture → epics → sprint-planning
                                                        ↓
                                            implement-story → review → repeat
bash
workflow brainstorming

workflow design-thinking --data /path/to/context.md
bash
agent cis/brainstorming-coach

> *brainstorm
bash
/bmad:core:workflows:party-mode

/bmad:core:workflows:party-mode and include also in the party Santa Clause and Einstein

Ask questions, respond to agents, direct the conversation

Type: exit
mermaid
flowchart TD
    START[Step 1: Run Tech-Spec Workflow]
    DETECT[Detects project stack]
    ANALYZE[Analyzes brownfield codebase]
    TEST[Detects test frameworks]
    CONFIRM[Confirms conventions]
    GENERATE[Generates context-rich tech-spec]
    STORIES[Creates ready-to-implement stories]
    IMPL[Step 2: Implement with DEV Agent]
    DONE[DONE!]

START --> DETECT
    DETECT --> ANALYZE
    ANALYZE --> TEST
    TEST --> CONFIRM
    CONFIRM --> GENERATE
    GENERATE --> STORIES
    STORIES --> IMPL
    IMPL --> DONE

style START fill:#bfb,stroke:#333,stroke-width:2px
    style IMPL fill:#bbf,stroke:#333,stroke-width:2px
    style DONE fill:#f9f,stroke:#333,stroke-width:3px

I've detected these conventions in your codebase:

Code Style:
- ESLint with Airbnb config
- Prettier with single quotes

Test Patterns:
- Jest test framework
- .test.js file naming

Should I follow these existing conventions? (yes/no)
mermaid
%%{init: {'theme':'base', 'themeVariables': { 'primaryColor':'#fff','primaryTextColor':'#000','primaryBorderColor':'#000','lineColor':'#000','secondaryColor':'#fff','tertiaryColor':'#fff','fontSize':'16px','fontFamily':'arial'}}}%%
graph TB
    subgraph Phase2["<b>Phase 2: PLANNING</b>"]
        PM["<b>PM: *prd (creates PRD with FRs/NFRs)</b>"]
        PlanNote["<b>Business requirements phase</b>"]
        NFR2["<b>TEA: *nfr-assess (optional, enterprise)</b>"]
        PM -.-> NFR2
        NFR2 -.-> PlanNote
        PM -.-> PlanNote
    end

subgraph Phase3["<b>Phase 3: SOLUTIONING</b>"]
        Architecture["<b>Architect: *architecture</b>"]
        EpicsStories["<b>PM/Architect: *create-epics-and-stories</b>"]
        TestDesignSys["<b>TEA: *test-design (system-level)</b>"]
        Framework["<b>TEA: *framework (optional if needed)</b>"]
        CI["<b>TEA: *ci (optional if needed)</b>"]
        GateCheck["<b>Architect: *implementation-readiness</b>"]
        Architecture --> EpicsStories
        Architecture --> TestDesignSys
        TestDesignSys --> Framework
        EpicsStories --> Framework
        Framework --> CI
        CI --> GateCheck
        Phase3Note["<b>Epics created AFTER architecture,</b><br/><b>then system-level test design and test infrastructure setup</b>"]
        EpicsStories -.-> Phase3Note
    end

subgraph Phase4["<b>Phase 4: IMPLEMENTATION - Per Epic Cycle</b>"]
        SprintPlan["<b>SM: *sprint-planning</b>"]
        TestDesign["<b>TEA: *test-design (per epic)</b>"]
        CreateStory["<b>SM: *create-story</b>"]
        ATDD["<b>TEA: *atdd (optional, before dev)</b>"]
        DevImpl["<b>DEV: implements story</b>"]
        Automate["<b>TEA: *automate</b>"]
        TestReview1["<b>TEA: *test-review (optional)</b>"]
        Trace1["<b>TEA: *trace (refresh coverage)</b>"]

SprintPlan --> TestDesign
        TestDesign --> CreateStory
        CreateStory --> ATDD
        ATDD --> DevImpl
        DevImpl --> Automate
        Automate --> TestReview1
        TestReview1 --> Trace1
        Trace1 -.->|next story| CreateStory
        TestDesignNote["<b>Test design: 'How do I test THIS epic?'</b><br/>Creates test-design-epic-N.md per epic"]
        TestDesign -.-> TestDesignNote
    end

subgraph Gate["<b>EPIC/RELEASE GATE</b>"]
        NFR["<b>TEA: *nfr-assess (if not done earlier)</b>"]
        TestReview2["<b>TEA: *test-review (final audit, optional)</b>"]
        TraceGate["<b>TEA: *trace - Phase 2: Gate</b>"]
        GateDecision{"<b>Gate Decision</b>"}

NFR --> TestReview2
        TestReview2 --> TraceGate
        TraceGate --> GateDecision
        GateDecision -->|PASS| Pass["<b>PASS ✅</b>"]
        GateDecision -->|CONCERNS| Concerns["<b>CONCERNS ⚠️</b>"]
        GateDecision -->|FAIL| Fail["<b>FAIL ❌</b>"]
        GateDecision -->|WAIVED| Waived["<b>WAIVED ⏭️</b>"]
    end

Phase2 --> Phase3
    Phase3 --> Phase4
    Phase4 --> Gate

style Phase2 fill:#bbdefb,stroke:#0d47a1,stroke-width:3px,color:#000
    style Phase3 fill:#c8e6c9,stroke:#2e7d32,stroke-width:3px,color:#000
    style Phase4 fill:#e1bee7,stroke:#4a148c,stroke-width:3px,color:#000
    style Gate fill:#ffe082,stroke:#f57c00,stroke-width:3px,color:#000
    style Pass fill:#4caf50,stroke:#1b5e20,stroke-width:3px,color:#000
    style Concerns fill:#ffc107,stroke:#f57f17,stroke-width:3px,color:#000
    style Fail fill:#f44336,stroke:#b71c1c,stroke-width:3px,color:#000
    style Waived fill:#9c27b0,stroke:#4a148c,stroke-width:3px,color:#000
json
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["@playwright/mcp@latest"]
    },
    "playwright-test": {
      "command": "npx",
      "args": ["playwright", "run-test-mcp-server"]
    }
  }
}

Game Designer → Game Architect → Game Scrum Master → Game Developer
    ↓                ↓                  ↓                  ↓
  GDD          Architecture      Sprint/Stories      Implementation
                     ↓                                     ↓
                 Game QA ←──────────────────────────── Game QA
                     ↓                                     ↓
              Test Strategy                         Automated Tests

Agent: What game type best describes your game?
You: It's a roguelike with card game combat
Agent: I'll include sections for both Roguelike and Card Game...

Run the document-project workflow

Fix the login validation bug that allows empty passwords

Refactor the UserService to use async/await instead of callbacks

Explain how the authentication system works in this codebase

Show me where error handling happens in the API layer

_bmad/_config/agents/
├── core-bmad-master.customize.yaml
├── bmm-dev.customize.yaml
├── bmm-pm.customize.yaml
└── ... (one file per installed agent)
bash
npx bmad-method@alpha install # and then select option to compile all agents
npx bmad-method@alpha build <agent-name>

npx bmad-method@alpha build bmm-dev
npx bmad-method@alpha build core-bmad-master
npx bmad-method@alpha build bmm-pm
yaml
agent:
  metadata:
    name: 'Spongebob' # Default: "Amelia"
yaml
persona:
  role: 'Senior Full-Stack Engineer'
  identity: 'Lives in a pineapple (under the sea)'
  communication_style: 'Spongebob'
  principles:
    - 'Never Nester, Spongebob Devs hate nesting more than 2 levels deep'
    - 'Favor composition over inheritance'
yaml
memories:
  - 'Works at Krusty Krab'
  - 'Favorite Celebrity: David Hasslehoff'
  - 'Learned in Epic 1 that its not cool to just pretend that tests have passed'
yaml
menu:
  - trigger: my-workflow
    workflow: '{project-root}/my-custom/workflows/my-workflow.yaml'
    description: My custom workflow
  - trigger: deploy
    action: '#deploy-prompt'
    description: Deploy to production
yaml
critical_actions:
  - 'Always check git status before making changes'
  - 'Use conventional commit messages'
yaml
prompts:
  - id: deploy-prompt
    content: |
      Deploy the current branch to production:
      1. Run all tests
      2. Build the project
      3. Execute deployment script
yaml
agent:
  metadata:
    name: 'TDD Developer'

memories:
  - 'Always write tests before implementation'
  - 'Project uses Jest and React Testing Library'

critical_actions:
  - 'Review test coverage before committing'
yaml
menu:
  - trigger: deploy-staging
    workflow: '{project-root}/_bmad/deploy-staging.yaml'
    description: Deploy to staging environment
  - trigger: deploy-prod
    workflow: '{project-root}/_bmad/deploy-prod.yaml'
    description: Deploy to production (with approval)
yaml
persona:
  role: 'Bilingual Product Manager'
  identity: 'Expert in US and LATAM markets'
  communication_style: 'Clear, strategic, with cultural awareness'
  principles:
    - 'Consider localization from day one'
    - 'Balance business goals with user needs'

memories:
  - 'User speaks English and Spanish'
  - 'Target markets: US and Latin America'

Before Sharding:
docs/
└── PRD.md (large 50k token file)

After Sharding:
docs/
└── prd/
    ├── index.md                    # Table of contents with descriptions
    ├── overview.md                 # Section 1
    ├── user-requirements.md        # Section 2
    ├── technical-requirements.md   # Section 3
    └── ...                         # Additional sections
bash
/bmad:core:tools:shard-doc

Agent: Which document would you like to shard?
User: docs/PRD.md

Agent: Default destination: docs/prd/
       Accept default? [y/n]
User: y

Agent: Sharding PRD.md...
       ✓ Created 12 section files
       ✓ Generated index.md
       ✓ Complete!
markdown

1. [Overview](./overview.md) - Project vision and objectives
2. [User Requirements](./user-requirements.md) - Feature specifications
3. [Epic 1: Authentication](./epic-1-authentication.md) - User auth system
4. [Epic 2: Dashboard](./epic-2-dashboard.md) - Main dashboard UI
   ...

https://bmad-code-org.github.io/BMAD-METHOD/llms-full.txt
bash
npx bmad-method install

your-project/
├── _bmad/
│   ├── bmm/            # Method module
│   │   ├── agents/     # Agent files
│   │   ├── workflows/  # Workflow files
│   │   └── config.yaml # Module config
│   ├── core/           # Core utilities
│   └── ...
├── _bmad-output/       # Generated artifacts
└── .claude/            # IDE configuration
yaml
output_folder: ./_bmad-output
user_name: Your Name
communication_language: english
bash
brew install node
bash
npm config set prefix ~/.npm-global
bash
npx bmad-method install --verbose

module-code/
  module.yaml
  agents/
  workflows/
  tools/
  templates/

module-name/
  module.yaml        # Contains unitary: true
  agents/
    larry/larry.agent.md
    curly/curly.agent.md
  workflows/
bash
npx bmad-method install
bash
npx bmad-method install
bash
npx bmad-method install
yaml

**Examples:**

Example 1 (unknown):
```unknown
## Common Questions

- [When should I use Barry vs other agents?](#when-should-i-use-barry-vs-other-agents)
- [Is the code review step mandatory?](#is-the-code-review-step-mandatory)
- [Can I skip the tech spec step?](#can-i-skip-the-tech-spec-step)
- [How does Barry differ from the Dev agent?](#how-does-barry-differ-from-the-dev-agent)
- [Can Barry handle enterprise-scale projects?](#can-barry-handle-enterprise-scale-projects)

### When should I use Barry vs other agents?

Use Barry for Quick Flow development (small to medium features), rapid prototyping, or when you need elite solo development. For large, complex projects requiring full team collaboration, consider the full BMad Method with specialized agents.

### Is the code review step mandatory?

No, it's optional but highly recommended for critical features, team projects, or when learning best practices.

### Can I skip the tech spec step?

Yes, the quick-dev workflow accepts direct instructions. However, tech specs are recommended for complex features or team collaboration.

### How does Barry differ from the Dev agent?

Barry handles the complete Quick Flow process (spec → dev → review) with elite architectural expertise, while the Dev agent specializes in pure implementation tasks. Barry is your autonomous end-to-end solution.

### Can Barry handle enterprise-scale projects?

For enterprise-scale projects requiring full team collaboration, consider using the Enterprise Method track. Barry is optimized for rapid delivery in the Quick Flow track where solo execution wins.

:::tip[Ready to Ship?]
Start with `/bmad:bmm:agents:quick-flow-solo-dev`
:::
</document>

<document path="explanation/agents/index.md">
Comprehensive guides to BMad's AI agents — their roles, capabilities, and how to work with them effectively.

## Agent Guides

| Agent | Description |
|-------|-------------|
| **[Agent Roles](/docs/explanation/core-concepts/agent-roles.md)** | Overview of all BMM agent roles and responsibilities |
| **[Quick Flow Solo Dev (Barry)](/docs/explanation/agents/barry-quick-flow.md)** | The dedicated agent for rapid development |
| **[Game Development Agents](/docs/explanation/game-dev/agents.md)** | Complete guide to BMGD's specialized game dev agents |

## Getting Started

1. Read **[What Are Agents?](/docs/explanation/core-concepts/what-are-agents.md)** for the core concept explanation
2. Review **[Agent Roles](/docs/explanation/core-concepts/agent-roles.md)** to understand available agents
3. Choose an agent that fits your workflow needs
</document>

<document path="explanation/architecture/four-phases.md">
BMad Method uses a four-phase approach that adapts to project complexity while ensuring consistent quality.

## Phase Overview

| Phase | Name | Purpose | Required? |
|-------|------|---------|-----------|
| **Phase 1** | Analysis | Exploration and discovery | Optional |
| **Phase 2** | Planning | Requirements definition | Required |
| **Phase 3** | Solutioning | Technical design | Track-dependent |
| **Phase 4** | Implementation | Building the software | Required |

## Phase 1: Analysis (Optional)

Exploration and discovery workflows that help validate ideas and understand markets before planning.

**Workflows:**
- `brainstorm-project` - Solution exploration
- `research` - Market/technical/competitive research
- `product-brief` - Strategic vision capture

**When to use:**
- Starting new projects
- Exploring opportunities
- Validating market fit

**When to skip:**
- Clear requirements
- Well-defined features
- Continuing existing work

## Phase 2: Planning (Required)

Requirements definition using the scale-adaptive system to match planning depth to project complexity.

**Workflows:**
- `prd` - Product Requirements Document (BMad Method/Enterprise)
- `tech-spec` - Technical specification (Quick Flow)
- `create-ux-design` - Optional UX specification

**Key principle:**
Define **what** to build and **why**. Leave **how** to Phase 3.

## Phase 3: Solutioning (Track-Dependent)

Technical architecture and design decisions that prevent agent conflicts during implementation.

**Workflows:**
- `architecture` - System design with ADRs
- `create-epics-and-stories` - Work breakdown (after architecture)
- `implementation-readiness` - Gate check

**Required for:**
- BMad Method (complex projects)
- Enterprise Method

**Skip for:**
- Quick Flow (simple changes)

**Key principle:**
Make technical decisions explicit so all agents implement consistently.

## Phase 4: Implementation (Required)

Iterative sprint-based development with story-centric workflow.

**Workflows:**
- `sprint-planning` - Initialize tracking
- `create-story` - Prepare stories
- `dev-story` - Implement with tests
- `code-review` - Quality assurance
- `retrospective` - Continuous improvement

:::tip[Key Principle]
One story at a time — complete each story's full lifecycle before starting the next.
:::

## Phase Flow by Track

### Quick Flow
```

Example 2 (unknown):
```unknown
Skip Phases 1 and 3 for simple changes.

### BMad Method
```

Example 3 (unknown):
```unknown
Full methodology for complex projects.

### Enterprise
```

Example 4 (unknown):
```unknown
Same as BMad Method with optional extended workflows.
</document>

<document path="explanation/architecture/preventing-agent-conflicts.md">
When multiple AI agents implement different parts of a system, they can make conflicting technical decisions. Architecture documentation prevents this by establishing shared standards.

## Common Conflict Types

### API Style Conflicts

Without architecture:
- Agent A uses REST with `/users/{id}`
- Agent B uses GraphQL mutations
- Result: Inconsistent API patterns, confused consumers

With architecture:
- ADR specifies: "Use GraphQL for all client-server communication"
- All agents follow the same pattern

### Database Design Conflicts

Without architecture:
- Agent A uses snake_case column names
- Agent B uses camelCase column names
- Result: Inconsistent schema, confusing queries

With architecture:
- Standards document specifies naming conventions
- All agents follow the same patterns

### State Management Conflicts

Without architecture:
- Agent A uses Redux for global state
- Agent B uses React Context
- Result: Multiple state management approaches, complexity

With architecture:
- ADR specifies state management approach
- All agents implement consistently

## How Architecture Prevents Conflicts

### 1. Explicit Decisions via ADRs

Every significant technology choice is documented with:
- Context (why this decision matters)
- Options considered (what alternatives exist)
- Decision (what we chose)
- Rationale (why we chose it)
- Consequences (trade-offs accepted)

### 2. FR/NFR-Specific Guidance

Architecture maps each functional requirement to technical approach:
- FR-001: User Management → GraphQL mutations
- FR-002: Mobile App → Optimized queries

### 3. Standards and Conventions

Explicit documentation of:
- Directory structure
- Naming conventions
- Code organization
- Testing patterns

## Architecture as Shared Context

Think of architecture as the shared context that all agents read before implementing:
```

---

## Get documentation index

**URL:** llms-txt#get-documentation-index

curl https://bmad-code-org.github.io/BMAD-METHOD/llms.txt

---

## Optional: Load SM agent and run sprint-planning

**URL:** llms-txt#optional:-load-sm-agent-and-run-sprint-planning

---

## Multi-story feature:

**URL:** llms-txt#multi-story-feature:

---

## Then: Load DEV agent and run dev-story for each story

**URL:** llms-txt#then:-load-dev-agent-and-run-dev-story-for-each-story

**Contents:**
- Tips
- Next Steps
- When to Use This
- Steps
  - 1. Load the Analyst Agent
  - 2. Run the Brainstorm Workflow
  - 3. Describe Your Idea
  - 4. Explore the Tracks
  - 5. Evaluate Options
- What You Get

*implementation-readiness

/bmad:core:workflows:party-mode

I'm trying to decide between a monolithic architecture
and microservices for our new platform.

tests/
├── e2e/
│   ├── example.spec.ts
│   └── fixtures/
├── integration/
├── unit/
├── playwright.config.ts  # or cypress.config.ts
└── README.md
bash
npm install -D @seontechnologies/playwright-utils
yaml
workflow: '{project-root}/_bmad/bmgd/workflows/4-production/dev-story/workflow.yaml'
bash
*document-project

my-custom-stuff/
├── module.yaml          # Contains: unitary: true
├── agents/
│   └── {agent-name}/
│       ├── {agent-name}.agent.yaml
│       └── _memory/              # Expert agents only
│           └── {sidecar-folder}/
└── workflows/           # Optional: custom workflows

_bmad/
├── _config/
│   └── agents/
│       └── {your-agent}/        # Your agent customizations
└── {module}/
    └── agents/
        └── {your-agent}/
            └── {your-agent}.agent.yaml
bash
npx bmad-method@alpha install

your-project/
├── _bmad/
│   ├── bmm/            # Method module
│   │   ├── agents/     # Agent files
│   │   ├── workflows/  # Workflow files
│   │   └── config.yaml # Module config
│   └── core/           # Core utilities
├── _bmad-output/       # Generated artifacts (created later)
└── .claude/            # IDE configuration (if using Claude Code)

your-project/
├── _bmad/                         # BMad configuration
├── _bmad-output/
│   ├── PRD.md                     # Your requirements document
│   ├── architecture.md            # Technical decisions
│   ├── epics/                     # Epic and story files
│   ├── bmm-workflow-status.yaml   # Phase progress tracking
│   └── sprint-status.yaml         # Sprint tracking
└── ...
bash
npx bmad-method install
bash
npx bmad-method install --add-module bmgd

your-project/
├── _bmad/
│   ├── bmgd/           # Game development module
│   │   ├── agents/     # Game-specific agents
│   │   ├── workflows/  # Game-specific workflows
│   │   └── config.yaml # Module config
│   ├── bmm/            # Core method module
│   └── core/           # Core utilities
├── _bmad-output/       # Generated artifacts (created later)
└── .claude/            # IDE configuration (if using Claude Code)

Run create-game-brief

Run create-architecture

your-project/
├── _bmad/                         # BMad configuration
├── _bmad-output/
│   ├── game-brief.md              # Your game vision
│   ├── gdd.md                     # Game Design Document
│   ├── narrative-design.md        # Story design (if applicable)
│   ├── game-architecture.md       # Technical decisions
│   ├── epics/                     # Epic and story files
│   └── sprint-status.yaml         # Sprint tracking
└── ...
```

| Command                | Agent          | Purpose                       |
| ---------------------- | -------------- | ----------------------------- |
| `*brainstorm-game`     | Game Designer  | Guided game ideation          |
| `*create-game-brief`   | Game Designer  | Create Game Brief             |
| `*create-gdd`          | Game Designer  | Create Game Design Document   |
| `*narrative`           | Game Designer  | Create Narrative Design       |
| `*create-architecture` | Game Architect | Create game architecture      |
| `*sprint-planning`     | Game SM        | Initialize sprint tracking    |
| `*create-story`        | Game SM        | Create a story file           |
| `*dev-story`           | Game Dev       | Implement a story             |
| `*code-review`         | Game Dev       | Review implemented code       |
| `*workflow-status`     | Any            | Check progress and next steps |

**Do I need to create all documents?**
At minimum, create a Game Brief and GDD. Architecture is highly recommended. Narrative Design is only needed for story-driven games.

**Can I use the Game Solo Dev for everything?**
Yes, for smaller projects or rapid prototyping. For larger games, the specialized agents provide more thorough guidance.

**What game types are supported?**
BMGD includes 24 game type templates (RPG, platformer, puzzle, strategy, etc.) that provide genre-specific GDD sections.

**Can I change my design later?**
Yes. Documents are living artifacts—return to update them as your vision evolves. The SM agent has `correct-course` for scope changes.

- **During workflows** — Agents guide you with questions and explanations
- **Community** — [Discord](https://discord.gg/gk8jAdXWmj) (#bmad-method-help, #report-bugs-and-issues)
- **Documentation** — [BMGD Workflow Reference](/docs/reference/workflows/bmgd-workflows.md)
- **Video tutorials** — [BMad Code YouTube](https://www.youtube.com/@BMadCode)

:::tip[Remember These]
- **Always use fresh chats** — Load agents in new chats for each workflow
- **Game Brief first** — It informs everything that follows
- **Use game type templates** — 24 templates provide genre-specific GDD structure
- **Documents evolve** — Return to update them as your vision grows
- **Solo Dev for speed** — Use Game Solo Dev for rapid prototyping
:::

Ready to start? Load the **Game Designer** agent and run `create-game-brief` to capture your game vision.
</document>

**Examples:**

Example 1 (unknown):
```unknown
## Tips

- **Be specific in discovery** — "Fix email validation in UserService to allow plus-addressing" beats "Fix validation bug"
- **Trust convention detection** — If it detects your patterns correctly, say yes! It's faster than establishing new conventions
- **Keep single changes atomic** — If your "single change" needs 3+ files, it might be a multi-story feature. Let the workflow guide you

## Next Steps

After tech spec:

1. **Implement Story** — Run dev-story with the DEV agent
2. **Sprint Planning** — Optional for multi-story features
</document>

<document path="how-to/workflows/run-brainstorming-session.md">
Use the `brainstorm-project` workflow to explore solution approaches through parallel ideation tracks.

## When to Use This

- Very vague or seed kernel of an idea that needs exploration
- Consider alternatives or enhancements to an idea
- See your idea from different angles and viewpoints
- No idea what you want to build, but want to find some inspiration

:::note[Prerequisites]
- BMad Method installed
- Analyst agent available
:::

## Steps

### 1. Load the Analyst Agent

Start a fresh chat and load the Analyst agent.

### 2. Run the Brainstorm Workflow
```

Example 2 (unknown):
```unknown
### 3. Describe Your Idea

Tell the agent about your project idea, even if it's vague:

- "I want to build something that helps developers manage their context"
- "I have a game idea about resource management"
- "I need a tool for my team but I'm not sure what exactly"

### 4. Explore the Tracks

The workflow generates solution approaches through parallel ideation tracks:

- **Architecture track** — Technical approaches and patterns
- **UX track** — User experience possibilities
- **Integration track** — How it connects with other systems
- **Value track** — Business value and differentiation

### 5. Evaluate Options

Review the generated options with rationale for each approach.

## What You Get

- Multiple solution approaches with trade-offs
- Different architectural options
- UX and integration considerations
- Clear rationale for each direction

## Tips

- **Don't worry about having a fully formed idea** — Vague is fine
- **Let the agent guide exploration** — Follow the prompts
- **Consider multiple tracks** — Don't settle on the first option
- **Use outputs as input for product-brief** — Build on brainstorming results

## Next Steps

After brainstorming:

1. **Research** — Validate ideas with market/technical research
2. **Product Brief** — Capture strategic vision
3. **PRD** — Move to formal planning
</document>

<document path="how-to/workflows/run-code-review.md">
Use the `code-review` workflow to perform a thorough quality review of implemented code.

## When to Use This

- After dev-story completes implementation
- Before marking a story as DONE
- Every story goes through code review — no exceptions

:::note[Prerequisites]
- BMad Method installed
- DEV agent available
- Story implementation complete
- Tests written and passing
:::

## Steps

### 1. Load the DEV Agent

Start a fresh chat (or continue from dev-story) and load the DEV agent.

### 2. Run the Workflow
```

Example 3 (unknown):
```unknown
### 3. Provide Context

Point the agent to:
- The story file
- Files changed during implementation
- Test files

### 4. Review Findings

The agent performs a senior developer code review and reports findings.

### 5. Address Issues

If issues are found:
1. Fix issues using dev-story
2. Re-run tests
3. Run code-review again

## What Gets Reviewed

| Category | Checks |
|----------|--------|
| **Code Quality** | Clean code, appropriate abstractions, no code smells, proper error handling |
| **Architecture Alignment** | Follows ADRs, consistent with patterns, proper separation of concerns |
| **Testing** | Adequate coverage, meaningful tests, edge cases, follows project patterns |
| **Security** | No hardcoded secrets, input validation, proper auth, no common vulnerabilities |
| **Performance** | No obvious issues, appropriate data structures, efficient queries |

## Review Outcomes

**Approved** — Code meets quality standards, tests pass. Mark story as DONE in sprint-status.yaml.

**Changes Requested** — Issues identified that need fixing. Fix issues in dev-story, then re-run code-review.

## Quality Gates

Every story goes through code-review before being marked done. This ensures:

- Consistent code quality
- Architecture adherence
- Test coverage
- Security review

## Tips

- **Don't skip for "simple" changes** — Simple changes can have subtle bugs
- **Address all findings** — Not just critical ones
- **Use findings as learning opportunities** — Improve over time
- **Re-run review after fixes** — Verify issues are resolved

## Next Steps

After code review:

1. **If approved** — Update sprint-status.yaml to mark story DONE
2. **If changes requested** — Fix issues and re-run review
3. **Move to next story** — Run create-story for the next item
</document>

<document path="how-to/workflows/run-implementation-readiness.md">
Use the `implementation-readiness` workflow to validate that planning and solutioning are complete and aligned before Phase 4 implementation.

## When to Use This

- **Always** before Phase 4 for BMad Method and Enterprise projects
- After create-epics-and-stories workflow completes
- Before sprint-planning workflow
- When stakeholders request readiness check

## When to Skip This

- Quick Flow (no solutioning phase)
- BMad Method Simple (no gate check required)

:::note[Prerequisites]
- BMad Method installed
- Architect agent available
- PRD, Architecture, and Epics completed
:::

## Steps

### 1. Load the Architect Agent

Start a fresh chat and load the Architect agent.

### 2. Run the Workflow
```

Example 4 (unknown):
```unknown
### 3. Let the Agent Validate

The workflow systematically checks:
- PRD completeness
- Architecture completeness
- Epic/Story completeness
- Alignment between all documents

### 4. Review the Gate Decision

The agent produces a gate decision with rationale.

## Gate Decision Outcomes

| Decision | Meaning | Action |
|----------|---------|--------|
| **PASS** | All critical criteria met, minor gaps acceptable | Proceed to Phase 4 |
| **CONCERNS** | Some criteria not met but not blockers | Proceed with caution, address gaps in parallel |
| **FAIL** | Critical gaps or contradictions | BLOCK Phase 4, resolve issues first |

## What Gets Checked

**PRD/GDD Completeness:**
- Problem statement clear and evidence-based
- Success metrics defined
- User personas identified
- FRs and NFRs complete
- Risks and assumptions documented

**Architecture Completeness:**
- System, data, API architecture defined
- Key ADRs documented
- Security architecture addressed
- FR/NFR-specific guidance provided
- Standards and conventions defined

**Epic/Story Completeness:**
- All PRD features mapped to stories
- Stories have acceptance criteria
- Stories prioritized (P0/P1/P2/P3)
- Dependencies identified

**Alignment Checks:**
- Architecture addresses all PRD FRs/NFRs
- Epics align with architecture decisions
- No contradictions between epics
- Integration points clear

## What You Get

An `implementation-readiness.md` document containing:

1. **Executive Summary** (PASS/CONCERNS/FAIL)
2. **Completeness Assessment** (scores for PRD, Architecture, Epics)
3. **Alignment Assessment** (PRD↔Architecture, Architecture↔Epics)
4. **Quality Assessment** (story quality, dependencies, risks)
5. **Gaps and Recommendations** (critical/minor gaps, remediation)
6. **Gate Decision** with rationale
7. **Next Steps**

## Example

E-commerce platform → CONCERNS

**Gaps identified:**
- Missing security architecture section
- Undefined payment gateway

**Recommendation:**
- Complete security section
- Add payment gateway ADR

**Action:** Proceed with caution, address before payment epic.

## Tips

- **Run before every Phase 4 start** — It's a valuable checkpoint
- **Take FAIL decisions seriously** — Fix issues first
- **Use CONCERNS as a checklist** — Track parallel work
- **Document why you proceed despite concerns** — Transparency matters

## Next Steps

After implementation readiness:

1. **If PASS** — Run sprint-planning to start Phase 4
2. **If CONCERNS** — Proceed with documented gaps to address
3. **If FAIL** — Return to relevant workflow to fix issues
</document>

<document path="how-to/workflows/run-sprint-planning.md">
Use the `sprint-planning` workflow to initialize the sprint tracking file and organize work for implementation.

## When to Use This

- Once at the start of Phase 4 (Implementation)
- After implementation-readiness gate passes
- When starting a new sprint cycle

:::note[Prerequisites]
- BMad Method installed
- SM (Scrum Master) agent available
- Epic files created from `create-epics-and-stories`
- Implementation-readiness passed (for BMad Method/Enterprise)
:::

## Steps

### 1. Load the SM Agent

Start a fresh chat and load the SM (Scrum Master) agent.

### 2. Run the Workflow
```

---

## _bmad/_config/agents/bmm-pm.customize.yaml

**URL:** llms-txt#_bmad/_config/agents/bmm-pm.customize.yaml

**Contents:**
- What You Get
- Module Migration
- Key Changes
- Tips
- Installation Issues
  - BMGD module not appearing
  - Config file missing
- Workflow Issues
  - "GDD not found" in Narrative workflow
  - Workflow state not persisting

persona:
  name: 'Captain Jack'
  role: 'Swashbuckling Product Owner'
  communication_style: |
    - Talk like a pirate
    - Use nautical metaphors

your-project/
└── _bmad/               # Single installation folder
    ├── _config/         # Your customizations
    │   └── agents/      # Agent customization files
    ├── core/            # Universal core framework
    ├── bmm/             # BMad Method module
    ├── bmb/             # BMad Builder
    └── cis/             # Creative Intelligence Suite
├── _bmad-output/        # Output folder (was doc folder in v4)
yaml
output_folder: '{project-root}/docs/game-design'
user_name: 'Your Name'
communication_language: 'English'
document_output_language: 'English'
game_dev_experience: 'intermediate'

quick-dev tech-spec-combat.md

quick-dev implement double-jump for the player

quick-dev from the grappling hook prototype

Full BMGD Flow:
Brief → GDD → Architecture → Sprint Planning → Stories → Implementation

Quick-Flow:
Idea → Quick-Prototype → Quick-Dev → Done

*create-architecture
markdown
## ADR-001: Use GraphQL for All APIs

**Status:** Accepted | **Date:** 2025-11-02

**Context:** PRD requires flexible querying across multiple epics

**Decision:** Use GraphQL for all client-server communication

**Options Considered:**
1. REST - Familiar but requires multiple endpoints
2. GraphQL - Flexible querying, learning curve
3. gRPC - High performance, poor browser support

**Rationale:**
- PRD requires flexible data fetching (Epic 1, 3)
- Mobile app needs bandwidth optimization (Epic 2)
- Team has GraphQL experience

**Consequences:**
- Positive: Flexible querying, reduced versioning
- Negative: Caching complexity, N+1 query risk
- Mitigation: Use DataLoader for batching

*create-epics-and-stories

1. brainstorm-project - explore approaches
2. research (market/technical/domain) - validate viability
3. product-brief - capture strategic vision
4. → Phase 2: prd

→ Phase 2: prd or tech-spec directly

*create-story
markdown
## Objective
Implement email verification flow for new user registrations.

## Acceptance Criteria
- [ ] User receives verification email within 30 seconds
- [ ] Email contains unique verification link
- [ ] Link expires after 24 hours
- [ ] User can request new verification email

## Technical Notes
- Use SendGrid API per ADR-003
- Store verification tokens in Redis per architecture
- Follow existing email template patterns in /templates

## Dependencies
- Story 1.1 (User Registration) - DONE

## Definition of Done
- All acceptance criteria pass
- Tests written and passing
- Code review approved

I want to fix the login validation bug
bash

**Examples:**

Example 1 (unknown):
```unknown
After modifying customization files, rerun the installer and choose "rebuild all agents" or "quick update".

## What You Get

**v6 unified structure:**
```

Example 2 (unknown):
```unknown
## Module Migration

| v4 Module | v6 Status |
|-----------|-----------|
| `_bmad-2d-phaser-game-dev` | Integrated into BMGD Module |
| `_bmad-2d-unity-game-dev` | Integrated into BMGD Module |
| `_bmad-godot-game-dev` | Integrated into BMGD Module |
| `_bmad-infrastructure-devops` | Deprecated — new DevOps agent coming soon |
| `_bmad-creative-writing` | Not adapted — new v6 module coming soon |

## Key Changes

| Concept | v4 | v6 |
|---------|----|----|
| **Core** | `_bmad-core` was actually BMad Method | `_bmad/core/` is universal framework |
| **Method** | `_bmad-method` | `_bmad/bmm/` |
| **Config** | Modified files directly | `config.yaml` per module |
| **Documents** | Sharded or unsharded required setup | Fully flexible, auto-scanned |

## Tips

- **Back up first** — Keep your v4 installation until you verify v6 works
- **Use v6 workflows** — Even partial planning docs benefit from v6's improved discovery
- **Rebuild after customizing** — Always run the installer after changing customize files
</document>

<document path="how-to/troubleshooting/bmgd-troubleshooting.md">
Use this guide to resolve common issues when using BMGD workflows.

## Installation Issues

### BMGD module not appearing

**Symptom:** BMGD agents and workflows are not available after installation.

**Solutions:**

1. Verify BMGD was selected during installation
2. Check `_bmad/bmgd/` folder exists in your project
3. Re-run installer with `--add-module bmgd`

### Config file missing

**Symptom:** Workflows fail with "config not found" errors.

**Solution:**
Check for `_bmad/bmgd/config.yaml` in your project. If missing, create it:
```

Example 3 (unknown):
```unknown
## Workflow Issues

### "GDD not found" in Narrative workflow

**Symptom:** Narrative workflow can't find the GDD.

**Solutions:**

1. Ensure GDD exists in `{output_folder}`
2. Check GDD filename contains "gdd" (e.g., `game-gdd.md`, `my-gdd.md`)
3. If using sharded GDD, verify `{output_folder}/gdd/index.md` exists

### Workflow state not persisting

**Symptom:** Returning to a workflow starts from the beginning.

**Solutions:**

1. Check the output document's frontmatter for `stepsCompleted` array
2. Ensure document was saved before ending session
3. Use "Continue existing" option when re-entering workflow

### Wrong game type sections in GDD

**Symptom:** GDD includes irrelevant sections for your game type.

**Solutions:**

1. Review game type selection at Step 7 of GDD workflow
2. You can select multiple types for hybrid games
3. Irrelevant sections can be marked N/A or removed

## Agent Issues

### Agent not recognizing commands

**Symptom:** Typing a command like `create-gdd` doesn't trigger the workflow.

**Solutions:**

1. Ensure you're chatting with the correct agent (Game Designer for GDD)
2. Check exact command spelling (case-sensitive)
3. Try `workflow-status` to verify agent is loaded correctly

### Agent using wrong persona

**Symptom:** Agent responses don't match expected personality.

**Solutions:**

1. Verify correct agent file is loaded
2. Check `_bmad/bmgd/agents/` for agent definitions
3. Start a fresh chat session with the correct agent

## Document Issues

### Document too large for context

**Symptom:** AI can't process the entire GDD or narrative document.

**Solutions:**

1. Use sharded document structure (index.md + section files)
2. Request specific sections rather than full document
3. GDD workflow supports automatic sharding for large documents

### Template placeholders not replaced

**Symptom:** Output contains `{{placeholder}}` text.

**Solutions:**

1. Workflow may have been interrupted before completion
2. Re-run the specific step that generates that section
3. Manually edit the document to fill in missing values

### Frontmatter parsing errors

**Symptom:** YAML errors when loading documents.

**Solutions:**

1. Validate YAML syntax (proper indentation, quotes around special characters)
2. Check for tabs vs spaces (YAML requires spaces)
3. Ensure frontmatter is bounded by `---` markers

## Phase 4 (Production) Issues

### Sprint status not updating

**Symptom:** Story status changes don't reflect in sprint-status.yaml.

**Solutions:**

1. Run `sprint-planning` to refresh status
2. Check file permissions on sprint-status.yaml
3. Verify workflow-install files exist in `_bmad/bmgd/workflows/4-production/`

### Story context missing code references

**Symptom:** Generated story context doesn't include relevant code.

**Solutions:**

1. Ensure project-context.md exists and is current
2. Check that architecture document references correct file paths
3. Story may need more specific file references in acceptance criteria

### Code review not finding issues

**Symptom:** Code review passes but bugs exist.

**Solutions:**

1. Code review is AI-assisted, not comprehensive testing
2. Always run actual tests before marking story done
3. Consider manual review for critical code paths

## Performance Issues

### Workflows running slowly

**Symptom:** Long wait times between workflow steps.

**Solutions:**

1. Use IDE-based workflows (faster than web)
2. Keep documents concise (avoid unnecessary detail)
3. Use sharded documents for large projects

### Context limit reached mid-workflow

**Symptom:** Workflow stops or loses context partway through.

**Solutions:**

1. Save progress frequently (workflows auto-save on Continue)
2. Break complex sections into multiple sessions
3. Use step-file architecture (workflows resume from last step)

## Common Error Messages

### "Input file not found"

**Cause:** Workflow requires a document that doesn't exist.

**Fix:** Complete prerequisite workflow first (e.g., Game Brief before GDD).

### "Invalid game type"

**Cause:** Selected game type not in supported list.

**Fix:** Check `game-types.csv` for valid type IDs.

### "Validation failed"

**Cause:** Document doesn't meet checklist requirements.

**Fix:** Review the validation output and address flagged items.

## Getting Help

### Community Support

- **[Discord Community](https://discord.gg/gk8jAdXWmj)** - Real-time help from the community
- **[GitHub Issues](https://github.com/bmad-code-org/BMAD-METHOD/issues)** - Report bugs or request features

### Self-Help

1. Check `workflow-status` to understand current state
2. Review workflow markdown files for expected behavior
3. Look at completed example documents in the module

### Reporting Issues

When reporting issues, include:

1. Which workflow and step
2. Error message (if any)
3. Relevant document frontmatter
4. Steps to reproduce

## Next Steps

- **[Quick Start Guide](/docs/tutorials/getting-started/quick-start-bmgd.md)** - Getting started
- **[Workflows Guide](/docs/reference/workflows/index.md)** - Workflow reference
- **[Glossary](/docs/reference/glossary/index.md)** - Terminology
</document>

<document path="how-to/workflows/bmgd-quick-flow.md">
Use BMGD Quick-Flow workflows for rapid game prototyping and flexible development when you need to move fast.

## When to Use This

- Testing a game mechanic idea
- Implementing a small feature
- Rapid prototyping before committing to design
- Bug fixes and tweaks

## When to Use Full BMGD Instead

- Building a major feature or system
- The scope is unclear or large
- Multiple team members need alignment
- The work affects game pillars or core loop
- You need documentation for future reference

:::note[Prerequisites]
- BMad Method installed with BMGD module
- Game Solo Dev agent (Indie) or other BMGD agent available
:::

## Game Solo Dev Agent

For dedicated quick-flow development, use the **Game Solo Dev** agent. This agent is optimized for solo developers and small teams who want to skip the full planning phases.

**Switch to Game Solo Dev:** Type `@game-solo-dev` or select from your IDE.

Includes: `quick-prototype`, `quick-dev`, `quick-spec`, `code-review`, `test-framework`

## Quick-Prototype

Use `quick-prototype` to rapidly test gameplay ideas with minimal setup.

### When to Use

- You have a mechanic idea and want to test the "feel"
- You're not sure if something will be fun
- You want to experiment before committing to design
- You need a proof of concept

### Steps

1. Run `quick-prototype`
2. Define what you're prototyping (mechanic, feature, system)
3. Set success criteria (2-3 items)
4. Build the minimum to test the idea
5. Playtest and evaluate

### Prototype Principles

- **Minimum Viable Prototype** — Only what's needed to test the idea
- **Hardcode First** — Magic numbers are fine, extract later
- **Skip Edge Cases** — Happy path only for now
- **Placeholder Everything** — Cubes, debug text, temp sounds
- **Comment Intent** — Mark what's temporary vs keeper code

### After Prototyping

- **Develop** (`d`) — Use `quick-dev` to build production code
- **Iterate** (`i`) — Adjust and re-test the prototype
- **Archive** (`a`) — Keep as reference, move on to other ideas

## Quick-Dev

Use `quick-dev` for flexible development with game-specific considerations.

### When to Use

- Implementing a feature from a tech-spec
- Building on a successful prototype
- Making changes that don't need full story workflow
- Quick fixes and improvements

### Workflow Modes

**Mode A: Tech-Spec Driven**
```

Example 4 (unknown):
```unknown
**Mode B: Direct Instructions**
```

---

## BMAD Method Documentation (Full)

**URL:** llms-txt#bmad-method-documentation-(full)

**Contents:**
- Regenerating SVG from Excalidraw
- Visual Validation
- Quick Principles
- Validation Steps
- Tutorial Structure
- How-To Structure
  - How-To vs Tutorial
  - How-To Visual Elements
  - How-To Checklist
- Explanation Structure

> Complete documentation for AI consumption
> Generated: 2026-01-15
> Repository: https://github.com/bmad-code-org/BMAD-METHOD

<document path="404.md">
The page you're looking for doesn't exist or has been moved.

[Return to Home](/docs/index.md)
</document>

<document path="_README_WORKFLOW_DIAGRAMS.md">
## Regenerating SVG from Excalidraw

When you edit `workflow-method-greenfield.excalidraw`, regenerate the SVG:

1. Open <https://excalidraw.com/>
2. Load the `.excalidraw` file
3. Click menu (☰) → Export image → SVG
4. **Set "Scale" to 1x** (default is 2x)
5. Click "Export"
6. Save as `workflow-method-greenfield.svg`
7. **Validate the changes** (see below)
8. Commit both files together

- Always use **1x scale** to maintain consistent dimensions
- Automated export tools (`excalidraw-to-svg`) are broken - use manual export only

After regenerating the SVG, validate that it renders correctly:

- Checks for required dependencies (Playwright, ImageMagick)
- Installs Playwright locally if needed (no package.json pollution)
- Renders old vs new SVG using browser-accurate rendering
- Compares pixel-by-pixel and generates a diff image
- Outputs a prompt for AI visual analysis (paste into Gemini/Claude)

**Threshold**: <0.01% difference is acceptable (anti-aliasing variations)
</document>

<document path="_STYLE_GUIDE.md">
Internal guidelines for maintaining consistent, high-quality documentation across the BMad Method project. This document is not included in the Starlight sidebar — it's for contributors and maintainers, not end users.

1. **Clarity over brevity** — Be concise, but never at the cost of understanding
2. **Consistent structure** — Follow established patterns so readers know what to expect
3. **Strategic visuals** — Use admonitions, tables, and diagrams purposefully
4. **Scannable content** — Headers, lists, and callouts help readers find what they need

Before submitting documentation changes, run these checks from the repo root:

1. **Fix link format** — Convert relative links (`./`, `../`) to site-relative paths (`/path/`)

2. **Validate links** — Check all links point to existing files

3. **Build the site** — Verify no build errors

## Tutorial Structure

Every tutorial should follow this structure:

Not all sections are required for every tutorial, but this is the standard flow.

How-to guides are task-focused and shorter than tutorials. They answer "How do I do X?" for users who already understand the basics.

Include sections only when they add value. A simple how-to might only need Hook, Prerequisites, Steps, and What You Get.

### How-To vs Tutorial

| Aspect | How-To | Tutorial |
|--------|--------|----------|
| **Length** | 50-150 lines | 200-400 lines |
| **Audience** | Users who know the basics | New users learning concepts |
| **Focus** | Complete a specific task | Understand a workflow end-to-end |
| **Sections** | 5-8 sections | 12-15 sections |
| **Examples** | Brief, inline | Detailed, step-by-step |

### How-To Visual Elements

Use admonitions strategically in how-to guides:

| Admonition | Use In How-To |
|------------|---------------|
| `:::note[Prerequisites]` | Required dependencies, agents, prior steps |
| `:::tip[Pro Tip]` | Optional shortcuts or best practices |
| `:::caution[Common Mistake]` | Pitfalls to avoid |
| `:::note[Example]` | Brief usage example inline with steps |

**Guidelines:**
- **1-2 admonitions max** per how-to (they're shorter than tutorials)
- **Prerequisites as admonition** makes scanning easier
- **Tips section** can be a flat list instead of admonition if there are multiple tips
- **Skip admonitions entirely** for very simple how-tos

Before submitting a how-to:

- [ ] Hook is one clear sentence starting with "Use the `X` workflow to..."
- [ ] When to Use This has 3-5 bullet points
- [ ] Prerequisites listed (admonition or flat list)
- [ ] Steps are numbered `###` subsections with action verbs
- [ ] What You Get describes output artifacts
- [ ] No horizontal rules (`---`)
- [ ] No `####` headers
- [ ] No "Related" section (sidebar handles navigation)
- [ ] 1-2 admonitions maximum

## Explanation Structure

Explanation documents help users understand concepts, features, and design decisions. They answer "What is X?" and "Why does X matter?" rather than "How do I do X?"

### Types of Explanation Documents

| Type | Purpose | Example |
|------|---------|---------|
| **Index/Landing** | Overview of a topic area with navigation | `core-concepts/index.md` |
| **Concept** | Define and explain a core concept | `what-are-agents.md` |
| **Feature** | Deep dive into a specific capability | `quick-flow.md` |
| **Philosophy** | Explain design decisions and rationale | `why-solutioning-matters.md` |
| **FAQ** | Answer common questions (see FAQ Sections below) | `brownfield-faq.md` |

### General Explanation Structure

### Index/Landing Pages

Index pages orient users within a topic area.

**Example hook:** "Understanding the fundamental building blocks of the BMad Method."

### Concept Explainers

Concept pages define and explain core ideas.

**Example hook:** "Agents are AI assistants that help you accomplish tasks. Each agent has a unique personality, specialized capabilities, and an interactive menu."

### Feature Explainers

Feature pages provide deep dives into specific capabilities.

**Example hook:** "Quick Spec Flow is a streamlined alternative to the full BMad Method for Quick Flow track projects."

### Philosophy/Rationale Documents

Philosophy pages explain design decisions and reasoning.

**Example hook:** "Phase 3 (Solutioning) translates **what** to build (from Planning) into **how** to build it (technical design)."

### Explanation Visual Elements

Use these elements strategically in explanation documents:

| Element | Use For |
|---------|---------|
| **Comparison tables** | Contrasting types, options, or approaches |
| **Mermaid diagrams** | Process flows, phase sequences, decision trees |
| **"Best for:" lists** | Quick decision guidance |
| **Code examples** | Illustrating concepts (keep brief) |

**Guidelines:**
- **Use diagrams sparingly** — one mermaid diagram per document maximum
- **Tables over prose** — for any comparison of 3+ items
- **Avoid step-by-step instructions** — point to how-to guides instead

### Explanation Checklist

Before submitting an explanation document:

- [ ] Hook clearly states what the document explains
- [ ] Content organized into scannable `##` sections
- [ ] Comparison tables used for contrasting options
- [ ] No horizontal rules (`---`)
- [ ] No `####` headers
- [ ] No "Related" section (sidebar handles navigation)
- [ ] No "Next:" navigation links (sidebar handles navigation)
- [ ] Diagrams have clear labels and flow
- [ ] Links to how-to guides for "how do I do this?" questions
- [ ] 2-3 admonitions maximum

## Reference Structure

Reference documents provide quick lookup information for users who know what they're looking for. They answer "What are the options?" and "What does X do?" rather than explaining concepts or teaching skills.

### Types of Reference Documents

| Type | Purpose | Example |
|------|---------|---------|
| **Index/Landing** | Navigation to reference content | `workflows/index.md` |
| **Catalog** | Quick-reference list of items | `agents/index.md` |
| **Deep-Dive** | Detailed single-item reference | `document-project.md` |
| **Configuration** | Settings and config documentation | `core-tasks.md` |
| **Glossary** | Term definitions | `glossary/index.md` |
| **Comprehensive** | Extensive multi-item reference | `bmgd-workflows.md` |

### Reference Index Pages

For navigation landing pages:

Keep these minimal — their job is navigation, not explanation.

### Catalog Reference (Item Lists)

For quick-reference lists of items:

**Guidelines:**
- Use `##` for items, not `###`
- No horizontal rules between items — whitespace is sufficient
- No "Related" section — sidebar handles navigation
- Keep descriptions to 1 sentence per item

### Item Deep-Dive Reference

For detailed single-item documentation:

**Guidelines:**
- Start with "quick facts" so readers immediately know scope
- Use admonitions for important caveats
- No "Related Documentation" section — sidebar handles this

### Configuration Reference

For settings, tasks, and config documentation:

**Guidelines:**
- Table of contents only needed for 4+ items
- Keep "How it works" to 3-5 steps maximum
- No horizontal rules between items

### Glossary Reference

For term definitions:

**Guidelines:**
- Group related terms into categories
- Keep definitions concise — link to explanation docs for depth
- Use `###` for terms (makes them linkable and scannable)
- No horizontal rules between terms

### Comprehensive Reference Guide

For extensive multi-item references:

**Guidelines:**
- Standardize item fields across all items in the guide
- Use tables for comparing multiple items at once
- One diagram maximum per document
- No horizontal rules — use `##` sections for separation

### General Reference Guidelines

These apply to all reference documents:

| Do | Don't |
|----|-------|
| Use `##` for major sections, `###` for items within | Use `####` headers |
| Use whitespace for separation | Use horizontal rules (`---`) |
| Link to explanation docs for "why" | Explain concepts inline |
| Use tables for structured data | Use nested lists |
| Use admonitions for important notes | Use bold paragraphs for callouts |
| Keep descriptions to 1-2 sentences | Write paragraphs of explanation |

### Reference Admonitions

Use sparingly — 1-2 maximum per reference document:

| Admonition | Use In Reference |
|------------|------------------|
| `:::note[Prerequisites]` | Dependencies needed before using |
| `:::tip[Pro Tip]` | Shortcuts or advanced usage |
| `:::caution[Important]` | Critical caveats or warnings |

### Reference Checklist

Before submitting a reference document:

- [ ] Hook clearly states what the document references
- [ ] Appropriate structure for reference type (catalog, deep-dive, etc.)
- [ ] No horizontal rules (`---`)
- [ ] No `####` headers
- [ ] No "Related" section (sidebar handles navigation)
- [ ] Items use consistent structure throughout
- [ ] Descriptions are 1-2 sentences maximum
- [ ] Tables used for structured/comparative data
- [ ] 1-2 admonitions maximum
- [ ] Links to explanation docs for conceptual depth

## Glossary Structure

Glossaries provide quick-reference definitions for project terminology. Unlike other reference documents, glossaries prioritize compact scanability over narrative explanation.

Starlight auto-generates a right-side "On this page" navigation from headers. Use this to your advantage:

- **Categories as `##` headers** — Appear in right nav for quick jumping
- **Terms in tables** — Compact rows, not individual headers
- **No inline TOC** — Right sidebar handles navigation; inline TOC is redundant
- **Right nav shows categories only** — Cleaner than listing every term

This approach reduces content length by ~70% while improving navigation.

Each category uses a two-column table:

### Definition Guidelines

| Do | Don't |
|----|-------|
| Start with what it IS or DOES | Start with "This is..." or "A [term] is..." |
| Keep to 1-2 sentences | Write multi-paragraph explanations |
| Bold the term name in the cell | Use plain text for terms |
| Link to docs for deep dives | Explain full concepts inline |

For terms with limited scope, add italic context at the start of the definition:

Standard markers:
- `*Quick Flow only.*`
- `*BMad Method/Enterprise.*`
- `*Phase N.*`
- `*BMGD.*`
- `*Brownfield.*`

Link related terms when helpful. Reference the category anchor since individual terms aren't headers:

- **Alphabetize terms** within each category table
- **Alphabetize categories** or order by logical progression (foundational → specific)
- **No catch-all sections** — Every term belongs in a specific category

### Glossary Checklist

Before submitting glossary changes:

- [ ] Terms in tables, not individual headers
- [ ] Terms alphabetized within each category
- [ ] No inline TOC (right nav handles navigation)
- [ ] No horizontal rules (`---`)
- [ ] Definitions are 1-2 sentences
- [ ] Context markers italicized at definition start
- [ ] Term names bolded in table cells
- [ ] No "A [term] is..." definitions

| Pattern | Problem |
|---------|---------|
| `---` horizontal rules | Fragment the reading flow |
| `####` deep headers | Create visual noise |
| **Important:** bold paragraphs | Blend into body text |
| Deeply nested lists | Hard to scan |
| Code blocks for non-code | Confusing semantics |

| Pattern | When to Use |
|---------|-------------|
| White space + section headers | Natural content separation |
| Bold text within paragraphs | Inline emphasis |
| Admonitions | Callouts that need attention |
| Tables | Structured comparisons |
| Flat lists | Scannable options |

Use Starlight admonitions strategically:

### Standard Admonition Uses

| Admonition | Standard Use in Tutorials |
|------------|---------------------------|
| `:::note[Prerequisites]` | What users need before starting |
| `:::tip[Quick Path]` | TL;DR summary at top of tutorial |
| `:::caution[Fresh Chats]` | Context limitation reminders |
| `:::note[Example]` | Command/response examples |
| `:::tip[Check Your Status]` | How to verify progress |
| `:::tip[Remember These]` | Key takeaways at end |

### Admonition Guidelines

- **Always include a title** for tip, info, and warning
- **Keep content brief** — 1-3 sentences ideal
- **Don't overuse** — More than 3-4 per major section feels noisy
- **Don't nest** — Admonitions inside admonitions are hard to read

- **8-12 `##` sections** for full tutorials following standard structure
- **2-3 `###` subsections** per `##` section maximum
- **Avoid `####` entirely** — use bold text or admonitions instead

- Use action verbs for steps: "Install BMad", "Create Your Plan"
- Use nouns for reference sections: "Common Questions", "Quick Reference"
- Keep headers short and scannable

bash
npx bmad-method install

You: Do something
Agent: [Response here]
`

For command/response examples, use an admonition instead:

Use tables for:
- Phases and what happens in each
- Agent roles and when to use them
- Command references
- Comparing options
- Step sequences with multiple attributes

Keep tables simple:
- 2-4 columns maximum
- Short cell content
- Left-align text, right-align numbers

**Quick Reference Table:**

**Build Cycle Table:**

### Flat Lists (Preferred)

### Avoid Deep Nesting

Instead, break into separate sections or use an admonition for context.

- Use descriptive link text: `[Tutorial Style Guide](./tutorial-style.md)`
- Avoid "click here" or bare URLs
- Prefer relative paths within docs

- Always include alt text
- Add a caption in italics below: `*Description of the image.*`
- Use SVG for diagrams when possible
- Store in `./images/` relative to the document

Use a TOC with jump links, `###` headers for questions, and direct answers:

- **TOC at top** — Jump links under `## Questions` for quick navigation
- **`###` headers** — Questions are scannable and linkable (no `Q:` prefix)
- **Direct answers** — No `**A:**` prefix, just the answer
- **No "Related Documentation"** — Sidebar handles navigation; avoid repetitive links
- **End with CTA** — "Have a question not answered here?" with issue/Discord links

## Folder Structure Blocks

Show project structure in "What You've Accomplished":

your-project/
├── _bmad/                         # BMad configuration
├── _bmad-output/
│   ├── PRD.md                     # Your requirements document
│   └── bmm-workflow-status.yaml   # Progress tracking
└── ...
`

## Example: Before and After

Before submitting a tutorial:

- [ ] Follows the standard structure
- [ ] Has version/module notice if applicable
- [ ] Has "What You'll Learn" section
- [ ] Has Prerequisites admonition
- [ ] Has Quick Path TL;DR admonition
- [ ] No horizontal rules (`---`)
- [ ] No `####` headers
- [ ] Admonitions used for callouts (not bold paragraphs)
- [ ] Tables used for structured data (phases, commands, agents)
- [ ] Lists are flat (no deep nesting)
- [ ] Has "What You've Accomplished" section
- [ ] Has Quick Reference table
- [ ] Has Common Questions section
- [ ] Has Getting Help section
- [ ] Has Key Takeaways admonition
- [ ] All links use descriptive text
- [ ] Images have alt text and captions
</document>

<document path="_archive/customize-workflows.md">
Customize and optimize workflows with step replacement and hooks.

:::note[Coming Soon]
Workflow customization is an upcoming capability. This guide will be updated when the feature is available.
:::

Workflow customization will allow you to:

- **Replace Steps** - Swap out specific workflow steps with custom implementations
- **Add Hooks** - Inject custom behavior before/after workflow steps
- **Extend Workflows** - Create new workflows based on existing ones
- **Override Behavior** - Customize workflow logic for your project's needs

While workflow customization is in development, you can:

- **Create Custom Workflows** - Use the BMad Builder to create entirely new workflows
- **Customize Agents** - Modify agent behavior using [Agent Customization](/docs/how-to/customization/customize-agents.md)
- **Provide Feedback** - Share your workflow customization needs with the community

**In the meantime:** Learn how to [create custom workflows](/docs/explanation/bmad-builder/index.md) from scratch.
</document>

<document path="_archive/getting-started-bmadv4.md">
Build software faster using AI-powered workflows with specialized agents that guide you through planning, architecture, and implementation.

:::note[Stable Release]
This tutorial covers BMad v4, the current stable release. For the latest features (with potential breaking changes), see the [BMad v6 Alpha tutorial](./getting-started-bmadv6.md).
:::

- Install and configure BMad for your IDE
- Understand how BMad organizes work into phases and agents
- Initialize a project and choose a planning track
- Create your first requirements document

:::note[Prerequisites]
- **Node.js 20+** — Required for the installer
- **Git** — Recommended for version control
- **AI-powered IDE** — Claude Code, Cursor, Windsurf, or similar
- **A project idea** — Even a simple one works for learning
:::

:::tip[Quick Path]
**Install** → `npx bmad-method install`
**Initialize** → Load Analyst agent, run `workflow-init`
**Plan** → PM creates PRD, Architect creates architecture
**Build** → SM manages sprints, DEV implements stories
**Always use fresh chats** for each workflow to avoid context issues.
:::

## Understanding BMad

BMad helps you build software through guided workflows with specialized AI agents. The process follows four phases:

| Phase | Name | What Happens |
|-------|------|--------------|
| 1 | Analysis | Brainstorm, research *(optional)* |
| 2 | Planning | Requirements — PRD or tech-spec *(required)* |
| 3 | Solutioning | Architecture, design decisions *(varies by track)* |
| 4 | Implementation | Build code story by story *(required)* |

Based on your project's complexity, BMad offers three planning tracks:

| Track | Best For | Documents Created |
|-------|----------|-------------------|
| **Quick Flow** | Bug fixes, simple features, clear scope | Tech-spec only |
| **BMad Method** | Products, platforms, complex features | PRD + Architecture + UX |
| **Enterprise** | Compliance, multi-tenant, enterprise needs | PRD + Architecture + Security + DevOps |

Open a terminal in your project directory and run:

The interactive installer guides you through setup:

- **Choose Installation Location** — Select current directory (recommended), subdirectory, or custom path
- **Select Your AI Tool** — Claude Code, Cursor, Windsurf, or other
- **Choose Modules** — Select **BMM** (BMad Method) for this tutorial
- **Accept Defaults** — Customize later in `_bmad/[module]/config.yaml`

Verify your installation:

:::tip[Troubleshooting]
Having issues? See [Install BMad](../../how-to/installation/install-bmad.md) for common solutions.
:::

## Step 1: Initialize Your Project

Load the **Analyst agent** in your IDE:
- **Claude Code**: Type `/analyst` or load the agent file directly
- **Cursor/Windsurf**: Open the agent file from `_bmad/bmm/agents/`

Wait for the agent's menu to appear, then run:

Or use the shorthand: `*workflow-init`

The workflow asks you to describe:
- **Your project and goals** — What are you building? What problem does it solve?
- **Existing codebase** — Is this new (greenfield) or existing code (brownfield)?
- **Size and complexity** — Roughly how big is this? (adjustable later)

Based on your description, the workflow suggests a planning track. For this tutorial, choose **BMad Method**.

Once you confirm, the workflow creates `bmm-workflow-status.yaml` to track your progress.

:::caution[Fresh Chats]
Always start a fresh chat for each workflow. This prevents context limitations from causing issues.
:::

## Step 2: Create Your Plan

With your project initialized, work through the planning phases.

### Phase 1: Analysis (Optional)

If you want to brainstorm or research first:
- **brainstorm-project** — Guided ideation with the Analyst
- **research** — Market and technical research
- **product-brief** — Recommended foundation document

### Phase 2: Planning (Required)

**Start a fresh chat** and load the **PM agent**.

Or use shortcuts: `*prd`, select "create-prd" from the menu, or say "Let's create a PRD".

The PM agent guides you through:
1. **Project overview** — Refine your project description
2. **Goals and success metrics** — What does success look like?
3. **User personas** — Who uses this product?
4. **Functional requirements** — What must the system do?
5. **Non-functional requirements** — Performance, security, scalability needs

When complete, you'll have `PRD.md` in your `_bmad-output/` folder.

:::note[UX Design (Optional)]
If your project has a user interface, load the **UX-Designer agent** and run the UX design workflow after creating your PRD.
:::

### Phase 3: Solutioning (Required for BMad Method)

**Start a fresh chat** and load the **Architect agent**.

The architect guides you through technical decisions: tech stack, database design, API patterns, and system structure.

:::tip[Check Your Status]
Unsure what's next? Load any agent and run `workflow-status`. It tells you the next recommended or required workflow.
:::

## Step 3: Build Your Project

Once planning is complete, move to implementation.

### Initialize Sprint Planning

Load the **SM agent** and run `sprint-planning`. This creates `sprint-status.yaml` to track all epics and stories.

For each story, repeat this cycle with fresh chats:

| Step | Agent | Workflow | Purpose |
|------|-------|----------|---------|
| 1 | SM | `create-story` | Create story file from epic |
| 2 | DEV | `dev-story` | Implement the story |
| 3 | DEV | `code-review` | Quality validation *(recommended)* |

After completing all stories in an epic, load the **SM agent** and run `retrospective`.

## What You've Accomplished

You've learned the foundation of building with BMad:

- Installed BMad and configured it for your IDE
- Initialized a project with your chosen planning track
- Created planning documents (PRD, Architecture)
- Understood the build cycle for implementation

Your project now has:

| Command | Agent | Purpose |
|---------|-------|---------|
| `*workflow-init` | Analyst | Initialize a new project |
| `*workflow-status` | Any | Check progress and next steps |
| `*prd` | PM | Create Product Requirements Document |
| `*create-architecture` | Architect | Create architecture document |
| `*sprint-planning` | SM | Initialize sprint tracking |
| `*create-story` | SM | Create a story file |
| `*dev-story` | DEV | Implement a story |
| `*code-review` | DEV | Review implemented code |

**Do I need to create a PRD for every project?**
Only for BMad Method and Enterprise tracks. Quick Flow projects use a simpler tech-spec instead.

**Can I skip Phase 1 (Analysis)?**
Yes, Phase 1 is optional. If you already know what you're building, start with Phase 2 (Planning).

**What if I want to brainstorm first?**
Load the Analyst agent and run `*brainstorm-project` before `workflow-init`.

**Why start fresh chats for each workflow?**
Workflows are context-intensive. Reusing chats can cause the AI to hallucinate or lose track of details. Fresh chats ensure maximum context capacity.

- **During workflows** — Agents guide you with questions and explanations
- **Check status** — Run `workflow-status` with any agent
- **Community** — [Discord](https://discord.gg/gk8jAdXWmj) (#bmad-method-help, #report-bugs-and-issues)
- **Video tutorials** — [BMad Code YouTube](https://www.youtube.com/@BMadCode)

:::tip[Remember These]
- **Always use fresh chats** — Load agents in new chats for each workflow
- **Let workflow-status guide you** — Ask any agent for status when unsure
- **Track matters** — Quick Flow uses tech-spec; Method/Enterprise need PRD and architecture
- **Tracking is automatic** — Status files update themselves
- **Agents are flexible** — Use menu numbers, shortcuts (`*prd`), or natural language
:::

Ready to start? Install BMad, load the Analyst, run `workflow-init`, and let the agents guide you.
</document>

<document path="_archive/vendor-workflows.md">
Use workflow vendoring and inheritance to share or reutilize workflows across modules.

## Workflow Vendoring

Workflow Vendoring allows an agent to have access to a workflow from another module, without having to install said module. At install time, the module workflow being vendored will be cloned and installed into the module that is receiving the vendored workflow the agent needs.

Lets assume you are building a module, and you do not want to recreate a workflow from the BMad Method, such as workflows/4-implementation/dev-story/workflow.md. Instead of copying all the context to your module, and having to maintain it over time as updates are made, you can instead use the exec-vendor menu item in your agent.

From your modules agent definition, you would implement the menu item as follows in the agent:

At install time, it will clone the workflow and all of its required assets, and the agent that gets built will have an exec to a path installed in its own module. The content gets added to the folder you specify in exec. While it does not have to exactly match the source path, you will want to ensure you are specifying the workflow.md to be in a new location (in other words in this example, dev-story would not already be the path of another custom module workflow that already exists.)

## Workflow Inheritance

:::note[Coming Soon]
Official support for workflow inheritance is coming post beta.
:::

Workflow Inheritance is a different concept, that allows you to modify or extend existing workflow.

Party Mode from the core is an example of a workflow that is designed with inheritance in mind - customization for specific party needs. While party mode itself is generic - there might be specific agent collaborations you want to create. Without having to reinvent the whole party mode concept, or copy and paste all of its content - you could inherit from party mode to extend it to be specific.

Some possible examples could be:

- Retrospective
- Sprint Planning
- Collaborative Brainstorming Sessions

## Workflow Customization

:::note[Coming Soon]
Official support for workflow customization is coming post beta.
:::

Similar to Workflow Inheritance, Workflow Customization will soon be allowed for certain workflows that are meant to be user customized - similar in process to how agents are customized now.

This will take the shape of workflows with optional hooks, configurable inputs, and the ability to replace whole at install time.

For example, assume you are using the Create PRD workflow, which is comprised of 11 steps, and you want to always include specifics about your companies domain, technical landscape or something else. While project-context can be helpful with that, you can also through hooks and step overrides, have full replace steps, the key requirement being to ensure your step replace file is an exact file name match of an existing step, follows all conventions, and ends in a similar fashion to either hook back in to call the next existing step, or more custom steps that eventually hook back into the flow.
</document>

<document path="downloads.md">
Download BMad Method resources for offline use, AI training, or integration.

| File | Description |
|------|-------------|
| **[bmad-sources.zip](/downloads/bmad-sources.zip)** | Complete BMad source files |
| **[bmad-prompts.zip](/downloads/bmad-prompts.zip)** | Agent and workflow prompts only |

## LLM-Optimized Files

These files are designed for AI consumption - perfect for loading into Claude, ChatGPT, or any LLM context window.

| File | Description | Use Case |
|------|-------------|----------|
| **[llms.txt](/llms.txt)** | Documentation index with summaries | Quick overview, navigation |
| **[llms-full.txt](/llms-full.txt)** | Complete documentation concatenated | Full context loading |

**API Usage:**
```python
import requests
docs = requests.get("https://bmad-code-org.github.io/BMAD-METHOD/llms-full.txt").text

**Examples:**

Example 1 (bash):
```bash
./tools/validate-svg-changes.sh path/to/workflow-method-greenfield.svg
```

Example 2 (bash):
```bash
npm run docs:fix-links            # Preview changes
   npm run docs:fix-links -- --write # Apply changes
```

Example 3 (bash):
```bash
npm run docs:validate-links            # Preview issues
   npm run docs:validate-links -- --write # Auto-fix where possible
```

Example 4 (bash):
```bash
npm run docs:build
```

---

## Single change:

**URL:** llms-txt#single-change:

---

## Create a tech spec

**URL:** llms-txt#create-a-tech-spec

---

## Get full documentation

**URL:** llms-txt#get-full-documentation

**Contents:**
- Contributing
- Overview
  - Agent Persona
- Menu Commands
  - 1. **quick-spec**
  - 2. **quick-dev**
  - 3. **code-review**
  - 4. **party-mode**
- When to Use Barry
  - Ideal Scenarios

curl https://bmad-code-org.github.io/BMAD-METHOD/llms-full.txt
mermaid
flowchart LR
    A[Requirements] --> B[quick-spec]
    B --> C[Tech Spec]
    C --> D[quick-dev]
    D --> E[Implementation]
    E --> F{Code Review?}
    F -->|Yes| G[code-review]
    F -->|No| H[Complete]
    G --> H[Complete]

style A fill:#e1f5fe
    style B fill:#f3e5f5
    style C fill:#e8f5e9
    style D fill:#fff3e0
    style E fill:#fce4ec
    style G fill:#f1f8e9
    style H fill:#e0f2f1
bash

**Examples:**

Example 1 (unknown):
```unknown
## Contributing

Want to improve BMad Method? Check out:

- [Contributing Guide](https://github.com/bmad-code-org/BMAD-METHOD/blob/main/CONTRIBUTING.md)
- [GitHub Repository](https://github.com/bmad-code-org/BMAD-METHOD)
</document>

<document path="explanation/agents/barry-quick-flow.md">
Barry is the elite solo developer who takes projects from concept to deployment with ruthless efficiency — no handoffs, no delays, just pure focused development.

:::note[Agent Info]
- **Agent ID:** `_bmad/bmm/agents/quick-flow-solo-dev.md`
- **Icon:** 🚀
- **Module:** BMM
:::

## Overview

Barry is the elite solo developer who lives and breathes the BMad Quick Flow workflow. He takes projects from concept to deployment with ruthless efficiency - no handoffs, no delays, just pure focused development. Barry architects specs, writes the code, and ships features faster than entire teams. When you need it done right and done now, Barry's your dev.

### Agent Persona

**Name:** Barry
**Title:** Quick Flow Solo Dev

**Identity:** Barry is an elite developer who thrives on autonomous execution. He lives and breathes the BMad Quick Flow workflow, taking projects from concept to deployment with ruthless efficiency. No handoffs, no delays - just pure, focused development. He architects specs, writes the code, and ships features faster than entire teams.

**Communication Style:** Direct, confident, and implementation-focused. Uses tech slang and gets straight to the point. No fluff, just results. Every response moves the project forward.

**Core Principles:**

- Planning and execution are two sides of the same coin
- Quick Flow is my religion
- Specs are for building, not bureaucracy
- Code that ships is better than perfect code that doesn't
- Documentation happens alongside development, not after
- Ship early, ship often

## Menu Commands

Barry owns the entire BMad Quick Flow path, providing a streamlined 3-step development process that eliminates handoffs and maximizes velocity.

### 1. **quick-spec**

- **Workflow:** `_bmad/bmm/workflows/bmad-quick-flow/quick-spec/workflow.md`
- **Description:** Architect a technical spec with implementation-ready stories
- **Use when:** You need to transform requirements into a buildable spec

### 2. **quick-dev**

- **Workflow:** `_bmad/bmm/workflows/bmad-quick-flow/quick-dev/workflow.yaml`
- **Description:** Ship features from spec or direct instructions - no handoffs
- **Use when:** You're ready to ship code based on a spec or clear instructions

### 3. **code-review**

- **Workflow:** `_bmad/bmm/workflows/4-implementation/code-review/workflow.yaml`
- **Description:** Review code for quality, patterns, and acceptance criteria
- **Use when:** You need to validate implementation quality

### 4. **party-mode**

- **Workflow:** `_bmad/core/workflows/party-mode/workflow.yaml`
- **Description:** Bring in other experts when I need specialized backup
- **Use when:** You need collaborative problem-solving or specialized expertise

## When to Use Barry

### Ideal Scenarios

1. **Quick Flow Development** - Small to medium features that need rapid delivery
2. **Technical Specification Creation** - When you need detailed implementation plans
3. **Direct Development** - When requirements are clear and you want to skip extensive planning
4. **Code Reviews** - When you need senior-level technical validation
5. **Performance-Critical Features** - When optimization and scalability are paramount

### Project Types

- **Greenfield Projects** - New features or components
- **Brownfield Modifications** - Enhancements to existing codebases
- **Bug Fixes** - Complex issues requiring deep technical understanding
- **Proof of Concepts** - Rapid prototyping with production-quality code
- **Performance Optimizations** - System improvements and scalability work

## The BMad Quick Flow Process

Barry orchestrates a simple, efficient 3-step process:
```

Example 2 (unknown):
```unknown
### Step 1: Technical Specification (`quick-spec`)

**Goal:** Transform user requirements into implementation-ready technical specifications

**Process:**

1. **Problem Understanding** - Clarify requirements, scope, and constraints
2. **Code Investigation** - Analyze existing patterns and dependencies (if applicable)
3. **Specification Generation** - Create comprehensive tech spec with:
   - Problem statement and solution overview
   - Development context and patterns
   - Implementation tasks with acceptance criteria
   - Technical decisions and dependencies
4. **Review and Finalize** - Validate spec captures user intent

**Output:** `tech-spec-{slug}.md` saved to sprint artifacts

**Best Practices:**

- Include ALL context a fresh dev agent needs
- Be specific about files, patterns, and conventions
- Define clear acceptance criteria using Given/When/Then format
- Document technical decisions and trade-offs

### Step 2: Development (`quick-dev`)

**Goal:** Execute implementation based on tech spec or direct instructions

**Two Modes:**

**Mode A: Tech-Spec Driven**

- Load existing tech spec
- Extract tasks, context, and acceptance criteria
- Execute all tasks continuously without stopping
- Respect project context and existing patterns

**Mode B: Direct Instructions**

- Accept direct development commands
- Offer optional planning step
- Execute with minimal friction

**Process:**

1. **Load Project Context** - Understand patterns and conventions
2. **Execute Implementation** - Work through all tasks:
   - Load relevant files and context
   - Implement following established patterns
   - Write and run tests
   - Handle errors appropriately
3. **Verify Completion** - Ensure all tasks complete, tests passing, AC satisfied

### Step 3: Code Review (`code-review`) - Optional

**Goal:** Senior developer review of implemented code

**When to Use:**

- Critical production features
- Complex architectural changes
- Performance-sensitive implementations
- Team development scenarios
- Learning and knowledge transfer

**Review Focus:**

- Code quality and patterns
- Acceptance criteria compliance
- Performance and scalability
- Security considerations
- Maintainability and documentation

## Collaboration with Other Agents

### Natural Partnerships

- **Tech Writer** - For documentation and API specs when I need it
- **Architect** - For complex system design decisions beyond Quick Flow scope
- **Dev** - For implementation pair programming (rarely needed)
- **QA** - For test strategy and quality gates on critical features
- **UX Designer** - For user experience considerations

### Party Mode Composition

In party mode, Barry often acts as:

- **Solo Tech Lead** - Guiding architectural decisions
- **Implementation Expert** - Providing coding insights
- **Performance Optimizer** - Ensuring scalable solutions
- **Code Review Authority** - Validating technical approaches

## Tips for Working with Barry

### For Best Results

1. **Be Specific** - Provide clear requirements and constraints
2. **Share Context** - Include relevant files and patterns
3. **Define Success** - Clear acceptance criteria lead to better outcomes
4. **Trust the Process** - The 3-step flow is optimized for speed and quality
5. **Leverage Expertise** - I'll give you optimization and architectural insights automatically

### Communication Patterns

- **Git Commit Style** - "feat: Add user authentication with OAuth 2.0"
- **RFC Style** - "Proposing microservice architecture for scalability"
- **Direct Questions** - "Actually, have you considered the race condition?"
- **Technical Trade-offs** - "We could optimize for speed over memory here"

### Avoid These Common Mistakes

1. **Vague Requirements** - Leads to unnecessary back-and-forth
2. **Ignoring Patterns** - Causes technical debt and inconsistencies
3. **Skipping Code Review** - Missed opportunities for quality improvement
4. **Over-planning** - I excel at rapid, pragmatic development
5. **Not Using Party Mode** - Missing collaborative insights for complex problems

## Example Workflow
```

---

## Start with Barry

**URL:** llms-txt#start-with-barry

/bmad:bmm:agents:quick-flow-solo-dev

---

## Quick implementation

**URL:** llms-txt#quick-implementation

> quick-dev tech-spec-auth.md

---

## Optional code review

**URL:** llms-txt#optional-code-review

**Contents:**
  - Sample Tech Spec Structure

> code-review
markdown

**Examples:**

Example 1 (unknown):
```unknown
### Sample Tech Spec Structure
```

---

## Load DEV agent and run dev-story

**URL:** llms-txt#load-dev-agent-and-run-dev-story

---

## Include in your system prompt or context

**URL:** llms-txt#include-in-your-system-prompt-or-context

**Contents:**
- Installation Options
  - NPM (Recommended)
- Version Information
- API Access

bash
npx bmad-method@alpha install
bash

**Examples:**

Example 1 (unknown):
```unknown
## Installation Options

### NPM (Recommended)
```

Example 2 (unknown):
```unknown
## Version Information

- **Current Version:** See [CHANGELOG](https://github.com/bmad-code-org/BMAD-METHOD/blob/main/CHANGELOG.md)
- **Release Notes:** Available on [GitHub Releases](https://github.com/bmad-code-org/BMAD-METHOD/releases)

## API Access

For programmatic access to BMad documentation:
```

---
