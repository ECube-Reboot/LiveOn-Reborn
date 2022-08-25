//
//  AuthenticationViewModel.swift
//  liveOnReboot
//
//  Created by Jineeee on 2022/08/20.
//

import Foundation
import AuthenticationServices

class AppleSignInViewModel: ObservableObject {
    private let authNetworkService = AuthNetworkService()
//    @ObservedObject var authNetworkService: AuthNetworkService = AuthNetworkService()
    
//    @Published var shouldShowAlert: Bool = false
//    @Published var alertTitle: String = ""
//    @Published var alertMessage: String = ""
//
//    //get notified when autherization state gets change
//    init() {
//        NotificationCenter.default.addObserver(self, selector: #selector(getAuthorizationState), name: ASAuthorizationAppleIDProvider.credentialRevokedNotification, object: nil)
//    }
    func didFinishAppleSignin(result: Result<ASAuthorization, Error>) -> String {
        print("in did finish apple signin")
        switch result {
        case.success(let auth):
            switch auth.credential {
                case let appleIdCredentials as ASAuthorizationAppleIDCredential:
                    if let appleUser = AppleUser(credentials: appleIdCredentials),
                       let appleUserData = try? JSONEncoder().encode(appleUser) {
                        UserDefaults.standard.setValue(appleUserData, forKey: appleUser.userId)
                        
                        let idToken = appleIdCredentials.identityToken!
                        let tokenStr = String(data: idToken, encoding: .ascii)
                        
                        print(tokenStr ?? "")
                        print("saved apple user")
                        return tokenStr!
            
                    } else {
                        print("missing some fields")
                    }
                default:
                    print(auth.credential)
            }
        case .failure(let error):
            print(error)
    }
    return "";
}
    
//    @objc func getAuthorizationState() {
//            let provider = ASAuthorizationAppleIDProvider()
//            if let userId = UserDefaults.standard.value(forKey: "userId") as? String {
//                provider.getCredentialState(forUserID: userId) { [self] (state, error) in
//                    switch state {
//                    case .authorized:
//                        // Credential are still valid
//                        break
//                    case .revoked:
//                        //Credential is revoked. It is similar to Logout. Show login screen.
//                        self.deleteUserData()
//                        break
//                    case .notFound:
//                        //Credential was not found. Show login screen.
//                        self.deleteUserData()
//                        break
//                    case .transferred:
//                        //The app is transfeered from one development team to another development team. You need to login again so show login screen.
//                        self.deleteUserData()
//                        break
//                    default:
//                        break
//                    }
//                }
//            }
//    }
}
