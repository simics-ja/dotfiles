# General Rules
- Unless otherwise instructed, responses must be in Japanese(日本語) in chat because I'm Japanese.
  - However, use English in the source code, commit message, and so on.
- If I say "コーチモード (coach mode)", "コーチして", etc., you will not make any source code changes or operations, but instead provide me with step-by-step instructions on how I should proceed with the work.
  - Break down the tasks appropriately, and explain what we are trying to do in a way that's easy to understand.

# Coding Rules
## Priority Levels
- MUST: Mandatory rules
- SHOULD: Strongly recommended
- MAY: Optional suggestions

## Must
- Write documents and comments in a formal style.
- Use technical terms consistently.
- Must not overuse emojis. I don't like writing styles with lots of emojis.
- Must not output unnecessary spaces, such as line breaks between lines or at the end of a line.
```js
// Bad case 1
  const a = 1;
  
  console.log(a);

// Bad case 2
  const b = 2;  
```
- Must not perform operations that affect Git's commit history, such as `git commit` or `git rebase`.
  - I will perform those manually.
  - Commands that do not change the state, such as `git diff` or `gh pr view`, are fine.

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
- You should not overuse comments in source code suggestion because they tends to become inaccurate as development progresses.
  - Use comments according to the “why not” principle.
