# MCP Servers for /new-day

Two MCP servers unlock the full skill. Here's how to connect them.

---

## 1. Granola MCP

**What it does:** Fetches your recent meetings, notes, attendees, and transcripts directly from Granola.

**Add to `~/.claude/settings.json`:**
```json
{
  "mcpServers": {
    "granola": {
      "type": "http",
      "url": "https://mcp.granola.ai/mcp"
    }
  }
}
```

Granola uses your local app session for auth — no API key needed. Just make sure Granola is running on your Mac.

---

## 2. Slack MCP

**What it does:** Surfaces DMs, @mentions, and channel highlights.

Claude Code is a supported partner client — no app setup or tokens needed. Just add the URL and Claude Code handles OAuth automatically.

**Add to `~/.claude/settings.json`:**
```json
{
  "mcpServers": {
    "slack": {
      "type": "http",
      "url": "https://mcp.slack.com/mcp"
    }
  }
}
```

On first use, Claude Code will open a browser window to authorize your Slack workspace.

**Docs:** https://docs.slack.dev/ai/slack-mcp-server

---

## 3. Filesystem (built-in)

No setup needed — Claude Code can already read `~/Desktop/Notes/` directly. Used as a fallback if Granola MCP is not connected.

---

## Combined settings.json

```json
{
  "mcpServers": {
    "granola": {
      "type": "http",
      "url": "https://mcp.granola.ai/mcp"
    },
    "slack": {
      "type": "http",
      "url": "https://mcp.slack.com/mcp"
    }
  }
}
```
