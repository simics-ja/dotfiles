---
name: rich-copy
description: Copy a Markdown reply to the clipboard as rich text (HTML) so it can be pasted into a rich text editor such as kintone, Confluence or Google Docs. Invoked explicitly as /rich-copy, optionally with a file path or a number N for the Nth latest reply.
disable-model-invocation: true
---

# rich-copy

Convert a Markdown reply to HTML and place it on the clipboard with `md2clip`, a command from `~/dotfiles/bin`.

Arguments: `$ARGUMENTS`

## Steps

1. Decide the source.
   - If the argument is a path to an existing file, use that file as the Markdown and skip step 2.
   - If the argument is a number N, the source is the Nth latest reply you wrote before this invocation.
   - Otherwise the source is your latest reply before this invocation.
2. Write the source to a temporary file created with `mktemp`.
   - Keep the content verbatim: headings, tables, lists, links, code blocks and wording.
   - Drop only conversational framing that has no meaning outside the chat, such as an opening line that announces the reply or a closing offer of further work.
   - Do not summarize, reorder or reword anything else.
3. Run the command.

   ```sh
   md2clip <file>
   ```

   - If the command is not found, tell the user that it is installed by `sh ~/dotfiles/setup_scripts/tools.sh` and that it requires pandoc.
   - If the command reports that no clipboard backend is available, pass on the HTML path it printed.
4. Report in one line what was copied, identified by its first heading or first line.
