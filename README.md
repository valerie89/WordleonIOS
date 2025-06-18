# Wordle Game App (iOS - Swift)

A customizable word-guessing game built in Swift using UIKit. Users guess a hidden word within a set number of attempts. The app provides visual feedback after each guess and supports settings customization such as word length, guess limit, themes, and an optional "alien mode" where the word changes after every attempt.

🎥 [Video Demo](https://www.loom.com/share/ad76d8f535d14dd69c751d5579a1c1e6)

---

## Features

- Adjustable word length (number of letters in the goal word)
- Customizable number of guesses (rows on the board)
- Selectable themed word sets to pull the goal word from
- “Alien mode” where the goal word changes after each guess
- Fully functional on-screen keyboard for user input
- Ability to delete individual letters while typing (without resetting the entire guess)
- Real-time color-coded feedback:
  - Green for correct letter in the correct position
  - Yellow for correct letter in the wrong position
  - Gray for incorrect letter
- Color theme options to personalize the game’s appearance
- Reset button to restart the game while keeping the current settings
- Responsive UI that adapts to the chosen word length and number of guesses
---

## Tech Stack

- **Language:** Swift
- **Framework:** UIKit
- **IDE:** Xcode
- **Architecture:** MVC pattern

---

## What I Learned
- Managing dynamic game states and UI reset logic
- Passing data between view controllers using dictionaries and type casting (`String`, `Int`)
- Creating and wiring navigation bar buttons with `@objc` and `UIBarButtonItem`
- Implementing condition-based rendering and modular Swift code
- Troubleshooting UI behavior while maintaining clean, readable code

---

## Challenges
- Ensuring the board reset worked correctly when changing settings
- Tracking the game state in “alien mode” without introducing logic bugs
- Debugging view controller transitions and maintaining component communication

---

## Future Improvements
- Add unit tests for validation and win/loss conditions
- Include haptic feedback and sound effects for better user experience
- Implement dark mode and accessibility improvements (e.g., VoiceOver support)
- Add persistent user stats (e.g., win streaks, guess averages)

---

## License
Copyright [2025] [Valerie Pena]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
