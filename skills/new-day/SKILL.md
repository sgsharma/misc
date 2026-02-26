# /new-day — Morning Startup Routine

You are helping the user start their workday. Follow these steps in order. Be concise and action-oriented. Do not pad with pleasantries. No emojis. Short bullet points only. No long paragraphs. If you don't have the information you need, ask for it directly. Do not make assumptions.

Important: All action items should be captured in the "TODOs" section of today's note. Other sections are just for context and notes, not action items. If you see something that looks like an action item in the meetings or Slack sections, add it to the TODOs section with a clear owner and deadline if possible. Don't create sections for the TODO list. Add a single word next to each item to indicate whether the task is from a meeting with a customer, an internal meeting, or from Slack.

---

## Step 1: Orient to the day

State today's date and day of the week. Note if it's Monday (review week goals) or Friday (flag end-of-week wrap-up needed).

---

## Step 2: Create today's daily note

Create a new markdown file at `~/Desktop/Notes/YYYY-MM-DD.md` (use today's actual date).

Use this template:

```markdown
# YYYY-MM-DD

## TODOs
- [ ]

## Meetings
<!-- Paste from Granola or calendar -->

## Team check-ins
<!-- Include any items from past 1:1s that need follow-up, blockers to clear for others, or anything you committed to someone that's due today -->
<!-- Quick notes on 1:1s, blockers to clear for others -->

## Product updates
<!-- Include any items from the _releases channel -->

## Product updates
<!-- Include any items from the _releases channel -->

## Top opportunities updates
<!-- Gather any updates on top opportunities from the past 24 hours from Slack or meetings -->

## Notes / scratch
```

After writing the file, print the path so the user can open it.

---

## Step 3: Surface Slack signal

Use the Slack MCP, fetch:
- Any DMs or @mentions from the past 18 hours
- A one-line summary of activity in key channels

Flag anything that looks like it needs a response today.

Use the Slack MCP, to fetch any messages from the past 12 hours in the `_releases` channel. If there are any, add a "Product updates" section to today's note and summarize the product update. 
---

## Step 4: Check recent meeting notes via Granola

If the Granola MCP server is connected, fetch meetings from the past 24 hours. List each meeting's title and attendees, then pull action items from all of them. Don't include attendees in the notes, don't include meetings without action items. 

If Granola MCP is not connected, fall back to scanning `~/Desktop/Notes/` for `.md` files modified in the last 24 hours that appear to be meeting notes (contain words like "meeting", "sync", "standup", "retro", "1:1"). If found, list their filenames and ask the same question.

If Granola MCP is not connected and no files are found, print: `⚠ Granola not connected — see ~/.claude/skills/new-day/mcp-setup.md`

---

## Step 5: Team pulse (small team of 2–5)

Use the team context file to understand the team structure and current priorities. List any follow-ups broken down by person if possible. If you don't have enough information, ask for it directly.

---

## Step 6: Sales pulse and forecast

Use the team context file to understand the top opportunities. Check for any updates on those opportunities in the past 24 hours in Slack or meetings. If you don't have enough information, ask for it directly.

## Done

Print a summary:
- Path to today's note
- Any Slack items needing a response
- Any Granola meetings with open action items

Then stop. Do not start doing the work unless asked.
