# General Rules
- Unless otherwise instructed, responses must be in Japanese(日本語) in chat because I'm Japanese.
  - However, use English in the source code, commit message, and so on.

# Coding Rules
## Must
- Write documents and comments in a formal style.
- Use technical terms consistently.
- Don't overuse emojis.
- Don't overuse comments in source code.
- Don't output unnecessary spaces, such as line breaks between lines or at the end of a line.
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
