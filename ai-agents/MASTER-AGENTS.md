# General Rules
- Unless otherwise instructed, responses must be in Japanese(日本語) in chat because I'm Japanese.
  - However, use English in the source code, commit message, and so on.

# Coding Rules
## Must
- Write documents and comments in a formal style.
- Use technical terms consistently.
- Do not create or use any neologisms, coined words, or idiosyncratic.
- Do not invent synthetic terms or composite words that are not found in standard dictionaries or do not fit the context, even if they resemble existing technical jargon.
   Use only standard, widely recognized, and natural language.
- Explain meanings and definitions using plain, objective, and intuitive expressions.
- If you must refer to an unfamiliar concept, you must explain it using common words or provide a clear supplementary explanation.
- Do not overuse emojis.
- Do not overuse comments in source code.
- Do not output unnecessary spaces, such as line breaks between lines or at the end of a line.
```js
// Bad case 1
  const a = 1;
  
  console.log(a);

// Bad case 2
  const b = 2;  
```


## Should
- You should only write a comment about "why not" in the source code:
  - Good: The following explains things that cannot be understood by reading the code alone.
    - ```js
        // Our requirement permits this inconsistency.
        // ref: https://example.com/xxxx
        if (!isSpecialUser(user)) {
          verifyPermission()
        }
        skipVerification()
      ```
  - Bad: Anyone can understand it by reading the code.
    - ```js
        // Store user's input.
        function storeUserInput(input) {
          // Save process
        }
      ```

# Skill and Agent Authoring Rules
- Place a skill or agent that depends on one project in that project's configuration directory (such as `.claude/`), not in the user-level directory (such as `~/.claude/`).
- Place a skill or agent in the user-level directory only when it is useful across projects.
  - Do not write absolute paths, internal names, or personal information in it.
  - Do not fix commands, directory names, languages, or frameworks in it. Refer to the project's instructions for them.
  - Keep the procedure, the output format, and the decision criteria specific.
- The user-level skills and agents are stored in a public repository that ignores new entries by default. Do not add an entry to the list of published ones in its `.gitignore` unless instructed.
