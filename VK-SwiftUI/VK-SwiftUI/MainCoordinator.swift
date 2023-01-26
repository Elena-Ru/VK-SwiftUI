////
////  MainCoordinator.swift
////  VK-SwiftUI
////
////  Created by Елена Русских on 25.01.2023.
////
//
//import Foundation
//import Combine
//import SwiftUI
//
//class MainCoordinator {
//    let navigationController: UINavigationController
//    private let loginViewModel: LoginViewModel = LoginViewModel()
//  //  private let coreDataService: CoreDataService = CoreDataService(modelName: "City")
//    private var cancellables: Set<AnyCancellable> = []
//    init(navigationController: UINavigationController) {
//        let loginView = LoginViewWK(modelData: loginViewModel)
//        let loginViewController = UIHostingController(rootView: loginView)
//        self.navigationController = UINavigationController(rootViewController:
//                                                            loginViewController)
//    }
//    public func start() {
//        loginViewModel.$loggedIn.subscribe(on: RunLoop.main).sink { [weak
//                                                                           self] isUserLoggedIn in
//            guard let self = self else { return }
//            if !isUserLoggedIn {
//                self.navigationController.popToRootViewController(animated:
//                                                                    true)
//            } else {
//                let citiesViewController = self.createCitiesController()
//                self.navigationController.pushViewController(citiesViewController, animated:
//                                                                true)
//            }
//        }.store(in: &cancellables)
//    }
//    private func createCitiesController() -> UIViewController {
//      //  let context = coreDataService.context
//        let citiesView = FriendsList()
//        return UIHostingController(rootView: citiesView)
//    }
//}
