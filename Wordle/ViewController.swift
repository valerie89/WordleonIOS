//
//  ViewController.swift
//  Wordle
//

import UIKit

class ViewController: UIViewController,
                      SettingsViewControllerDelegate {
  
  @IBOutlet weak var wordsCollectionView: UICollectionView!
  @IBOutlet weak var keyboardCollectionView: UICollectionView!
  
  private var boardController: BoardController!
  private var keyboardController: KeyboardController!
  
  private let segueIdentifier = "SettingsViewControllerSegue"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupNavigationBar()
    
    boardController = BoardController(collectionView: wordsCollectionView)
    keyboardController = KeyboardController(collectionView: keyboardCollectionView)
    keyboardController.didSelectString = { [unowned self] string in
      if string == kDeleteKey {
        self.boardController.deleteLastCharacter()
      } else {
        self.boardController.enter(string)
      }
    }
    let rightBarButtonItem = UIBarButtonItem(title: "Settings",
                                             style: .plain,
                                             target: self,
                                             action: #selector(didTapSettingsButton))
    rightBarButtonItem.tintColor = .white
    navigationItem.rightBarButtonItem = rightBarButtonItem
    //  5. Add a button on the left-hand side of the navigation bar to reset the
    // game with the current settings
    // Tip 1: Look at how the `rightBarButton` is created and use it as an example. You may create a new
    // function that gets called similar to `didTapSettingsButton`. Make use of the online documentation and
    // CMD + click to learn more about what methods and properties you can use
    // Tip 2: You'll want to use and implement `resetBoardWithCurrentSettings` inside of BoardController.swift
    // in the function that you fire when the button is tapped
      let leftBarButtonItem = UIBarButtonItem(
          title: "Reset",
          style: .plain,
          target: self,
          action: #selector(didTapResetButton)
      )
      leftBarButtonItem.tintColor = .white
      navigationItem.leftBarButtonItem = leftBarButtonItem
  }
  
  @objc private func didTapSettingsButton() {
    performSegue(withIdentifier: segueIdentifier, sender: nil)
  }
    @objc private func didTapResetButton() {
        boardController.resetBoardWithCurrentSettings()
    }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard segue.identifier == segueIdentifier else { return }
    let settingsViewController = segue.destination as! SettingsViewController
    settingsViewController.delegate = self
  }
  
  func didChangeSettings(with settings: [String: Any]) {
    boardController.resetBoard(with: settings)
  }
}

