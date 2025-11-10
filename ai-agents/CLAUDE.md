# Priority Levels
- MUST: Mandatory rules
- SHOULD: Strongly recommended
- MAY: Optional suggestions

# Must
- Unless otherwise instructed, responses must be in Japanese in chat.
  - However, use English in the source code, commit message, and so on.
- Write documents and comments in a formal style.
- Use technical terms consistently.

# Must not
- Don't overuse emojis. I don't like writing styles with lots of emojis.
- Do not output unnecessary spaces, such as line breaks between lines or at the end of a line.
```js
// Bad case 1
  const a = 1;
  
  console.log(a);

// Bad case 2
  const b = 2;  
```

# Should
- You should only write a comment about "why not" in the source code:
  - Good: The following explains things that cannot be understood by reading the code alone.
    - ```js
        // Our requirement permits this inconsistency.
        // Discussion record: https://example.com/xxxx
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

# Should not
- You should not overuse comments in source code suggestion because they tends to become inaccurate as development progresses.
  - Use comments according to the “why not” principle.
