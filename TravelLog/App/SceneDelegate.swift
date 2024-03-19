//
//  SceneDelegate.swift
//  TravelLog
//
//  Created by Nikoloz Gachechiladze on 15.03.24.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        setupWindow(with: scene)
        checkAuth()
    }
    
    
    private func setupWindow(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        self.window?.makeKeyAndVisible()
    }
    
    public func checkAuth() {
        if Auth.auth().currentUser == nil {
            goToController(to: LoginController())
        } else {
            goToController(to: HomePageController() )
        }
    }
    
    private func goToController(to viewController: UIViewController) {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 0.2) {
                self?.window?.layer.opacity = 0
            } completion: { [weak self] _ in
                let nav = UINavigationController(rootViewController: viewController)
                nav.modalPresentationStyle = .fullScreen
                self?.window?.rootViewController =  nav
                UIView.animate(withDuration: 0.2) {
                    self?.window?.layer.opacity = 1
                }
            }

        }
    }
    
}


