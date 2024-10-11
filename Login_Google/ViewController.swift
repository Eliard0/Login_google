//
//  ViewController.swift
//  Login_Google
//
//  Created by Eliardo Venancio on 09/10/24.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        setUpView()
        
        signInButtonDefault.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        
        signInButtonStyleOne.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        
        signInButtonStyleTwo.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        
        signInButtonStyleThree.addTarget(self, action: #selector(signIn), for: .touchUpInside)
        
        buttonLogin.addTarget(self, action: #selector(signIn), for: .touchUpInside)
    }
    
    private lazy var signInButtonDefault: GIDSignInButton = {
        let button = GIDSignInButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var signInButtonStyleOne: GIDSignInButton = {
        let button = GIDSignInButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.style = .wide
        button.colorScheme = .dark
        return button
    }()

    private lazy var signInButtonStyleTwo: GIDSignInButton = {
        let button = GIDSignInButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.style = .standard
        button.colorScheme = .light
        return button
    }()
    
    private lazy var signInButtonStyleThree: GIDSignInButton = {
        let button = GIDSignInButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.style = .iconOnly
        button.colorScheme = .dark
        return button
    }()
    
    private lazy var buttonLogin: UIButton = {
        let buttonLogin = UIButton()
        buttonLogin.setTitle("Entrar", for: .normal)
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        buttonLogin.backgroundColor = .white
        buttonLogin.setTitleColor(.blue , for: .normal)
        buttonLogin.layer.cornerRadius = 5
        
        
        return buttonLogin
    }()
    
    private func setUpView(){
        setHierarchy()
        setConstrants()
    }
    
    private func setHierarchy(){
        view.addSubview(signInButtonDefault)
        view.addSubview(signInButtonStyleOne)
        view.addSubview(signInButtonStyleTwo)
        view.addSubview(signInButtonStyleThree)
        view.addSubview(buttonLogin)
    }
    
    private func setConstrants(){
        
        NSLayoutConstraint.activate([
            signInButtonDefault.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            signInButtonDefault.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            signInButtonStyleOne.topAnchor.constraint(equalTo: signInButtonDefault.bottomAnchor, constant: 30),
            signInButtonStyleOne.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButtonStyleOne.widthAnchor.constraint(equalToConstant: 230),
            signInButtonStyleOne.heightAnchor.constraint(equalToConstant: 65)
        ])
        
        NSLayoutConstraint.activate([
            signInButtonStyleTwo.topAnchor.constraint(equalTo: signInButtonStyleOne.bottomAnchor, constant: 30),
            signInButtonStyleTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButtonStyleTwo.widthAnchor.constraint(equalTo: signInButtonStyleOne.widthAnchor),
            signInButtonStyleTwo.heightAnchor.constraint(equalTo: signInButtonStyleOne.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            signInButtonStyleThree.topAnchor.constraint(equalTo: signInButtonStyleTwo.bottomAnchor, constant: 30),
            signInButtonStyleThree.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButtonStyleTwo.widthAnchor.constraint(equalTo: signInButtonStyleOne.widthAnchor),
            signInButtonStyleThree.heightAnchor.constraint(equalTo: signInButtonStyleOne.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttonLogin.topAnchor.constraint(equalTo: signInButtonStyleThree.bottomAnchor, constant: 30),
            buttonLogin.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonLogin.widthAnchor.constraint(equalTo: signInButtonStyleOne.widthAnchor),
            buttonLogin.heightAnchor.constraint(equalTo: signInButtonStyleOne.heightAnchor)
        ])
        
        
    }
    
    @IBAction func signIn(sender: Any) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }
            
            if let error = error {
                print("Error signing in: \(error.localizedDescription)")
                return
            }
            
            guard let user = signInResult?.user else { return }
            print("User signed in: \(user.profile?.name ?? "No Name")")
        }
    }
    
}
