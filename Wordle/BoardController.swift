//
//  BoardController.swift
//  Wordle

import Foundation
import UIKit

class BoardController: NSObject,
                       UICollectionViewDataSource,
                       UICollectionViewDelegate,
                       UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    var numItemsPerRow = 5
    var numRows = 6
    let collectionView: UICollectionView
    var goalWord: [String]
    
    var numTimesGuessed = 0
    var isAlienWordle = false
    var currRow: Int {
        return numTimesGuessed / numItemsPerRow
    }
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        let rawTheme = SettingsManager.shared.settingsDictionary[kWordThemeKey] as! String
        let theme = WordTheme(rawValue: rawTheme)!
        self.goalWord = WordGenerator.generateGoalWord(with: theme)
        super.init()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: - Public Methods
    func resetBoard(with settings: [String: Any]) {
        applyNumLettersSettings(with: settings)
        applyNumGuessesSettings(with: settings)
        applyThemeSettings(with: settings)
        applyIsAlienWordleSettings(with: settings)
        numTimesGuessed = 0
        collectionView.reloadData()
    }
    
    // 5. (optional): This function only needs to be implemented if you decide to do the optional requirement (see Pt. 1 in ViewController.swift)
    // This function should reset the board with the current settings without changing the goalWord
    // Tip: Take a look at how resetBoard is implemented above. The only difference is that you don't want to change the settings
    func resetBoardWithCurrentSettings() {
        numTimesGuessed = 0
        collectionView.reloadData()
    }
    
    // 1. Implement applyNumLettersSettings to change the number of letters in the goal word
    // Tip 1: Use a breakpoint to inspect or print the `settings` argument
    // Tip 2: There is a constant `kNumLettersKey` in Constants.swift that you can use as the key to grab the value in the dictionary
    // Tip 3: Assign the correct value of the setting to the `numItemsPerRow` property.
    // Tip 4: You will need to cast the value to the correct type
    // Checkpoint: Correctly implementing this should allow you to change the number of letters in the goal word!
    
    
    // what does [String: Any] mean? Dictionary called settings & in Swift it holds key-value pairs like ["numLetters": 5, "hardMode": true]. The type [String: Any] means: 1. All the keys are Strings (like "numLetters") 2. All the values can be any type — like Int, Bool, String, etc.
    
    private func applyNumLettersSettings(with settings: [String: Any]){
        // as? Int means that we have to ensure numLetters is an Int so we pass that if it passes then it unwraps then considered as the value "numLetters"
        if let numLetters = settings[kNumLettersKey] as? Int{
            // we use self when we want to chnage the orginality of our object. The number of boxes per row (like for each letter in the word) is controlled by numItemsPerRow. And we set numItemsPerRow to numLetters which comes from the settings. If numLetters = 5 → there will be 5 boxes per row.
            self.numItemsPerRow = numLetters
        }
    }
    
    // 2. Implement applyNumGuessesSettings to change the number of rows in the board
    // Tip 1: Use a breakpoint to inspect or print the `settings` argument
    // Tip 2: There is a constant `kNumGuessesKey` in Constants.swift that you can use as the key to grab the value in the dictionary
    // Tip 3: Assign the correct value of the setting to the `numRows` property.
    // Tip 4: You will need to cast the value to the correct type
    // Checkpoint: Correctly implementing this should allow you to change the number of rows in the board!
    private func applyNumGuessesSettings(with settings: [String: Any]) {
        if let numGuesses = settings[kNumGuessesKey] as? Int{
            self.numRows = numGuesses
        }
    }
    
    // 3. Implement applyThemeSettings to change the goal word according to the theme
    // Tip 1: There is a constant `kWordThemeKey` in Constants.swift that you can use as the key to grab the theme as a String in the dictionary
    // Tip 2: Pass-in the theme to `WordGenerator.generateGoalWord` (see WordGenerator.swift) and assign its result to the `goalWord` defined above
    //  - The value stored in the settings dictionary is a String, but `WordGenerator.generateGoalWord` expects a WordTheme type.
    //    Use the `WordTheme(rawValue:)` initializer to pass-in the string from the dictionary to get the correct type
    // Checkpoint: Correctly implementing this should allow you to change the theme of the goal word! Use breakpoints or print statements
    // to check the before/after value of goalWord and see if it changes to the correct theme
    private func applyThemeSettings(with settings: [String: Any]) {
        if let wordTheme = settings[kWordThemeKey] as? String,
           let theme = WordTheme(rawValue: wordTheme) {
            self.goalWord = WordGenerator.generateGoalWord(with: theme)
        }
    }
    
    // 4. Implement applyIsAlienWordleSettings to change the goal word after each guess
    // Tip 1: There is a constant `kIsAlienWordleKey` in Constants.swift that you can use as the key to grab the value in the dictionary
    // Tip 2: There is a corresponding property located in this file that you should assign the value of the setting to (look at the "Properties" section above).
    // Checkpoint: Correctly implementing this function should change the goal word each time the user inputs an entire row of letters
    private func applyIsAlienWordleSettings(with settings: [String: Any]) {
        if let isAlienWordle = settings[kIsAlienWordleKey] as? Bool {
            self.isAlienWordle = isAlienWordle
        }
    }
}
