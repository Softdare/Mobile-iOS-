//
//  ViewController.swift
//  Softdare
//
//  Created by Nazif Enes Kızılcin on 9.05.2022.
//

import UIKit

class SignInViewController: UIViewController {
    // MARK: Constants And Variables
    let viewModel = SignInViewModel()
    
    @IBOutlet weak var usernameAndEmailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Self Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        //Bind the data on load.
        self.setupBinders()
        
    }
    // MARK: Binding the listener methods to view model to provide a two-way reactive application that model triggers UI update or UI triggers model update.
    
    func setupBinders() {
        viewModel.bind { success in
            
        }
    }
    // MARK: UI Actions
    
    // TODO: didSignInButtonTapped --> which calls the sign in view model sign in and validation functionality.
    @IBAction func didSignInButtonTapped(_ sender: UIButton) {
        activityIndicator.isHidden = false
        if usernameAndEmailTF.text == "" || passwordTF.text == "" {
            showError(.empty("The input fields can not be empty!"))
        }
    }
    
    
    
    // TODO: didSignUpButtonTapped --> routes to the Sign Up View.
    @IBAction func didSignUpButtonTapped(_ sender: UIBarButtonItem) {
        
    }
    // MARK: Error Handling
    
    func showError(_ type: Error) {
        switch type {
        case .empty(let message):
            break
        }
    }
    enum Error {
        case empty(_ message : String)
    }
}

