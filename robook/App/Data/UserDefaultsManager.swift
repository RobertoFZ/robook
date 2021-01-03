//
//  UserDefaultsManager.swift
//  Subasta Ganadera
//
//  Created by Roberto Franco on 04/09/20.
//  Copyright © 2020 Roberto Franco. All rights reserved.
//

import Foundation

class UserDefaultsManager {
    
    static let defaults = UserDefaults.standard
    
    class func saveUser(_ user: User){
        defaults.set(user.id, forKey: Preferences.UserPreferences.ID.rawValue)
        defaults.set(user.first_name, forKey: Preferences.UserPreferences.FirstName.rawValue)
        defaults.set(user.last_name, forKey: Preferences.UserPreferences.LastName.rawValue)
        defaults.set(user.email, forKey: Preferences.UserPreferences.Email.rawValue)
        defaults.set(user.profile.locale, forKey: Preferences.ProfilePreferences.Locale.rawValue)
        defaults.set(user.token, forKey: Preferences.UserPreferences.Token.rawValue)
    }
    
    class func clearUser(){
        defaults.removeObject(forKey: Preferences.UserPreferences.ID.rawValue)
        defaults.removeObject(forKey: Preferences.UserPreferences.FirstName.rawValue)
        defaults.removeObject(forKey: Preferences.UserPreferences.LastName.rawValue)
        defaults.removeObject(forKey: Preferences.UserPreferences.Email.rawValue)
        defaults.removeObject(forKey: Preferences.ProfilePreferences.Locale.rawValue)
        defaults.removeObject(forKey: Preferences.UserPreferences.Token.rawValue)
    }
    
    class func retrieveUser() -> User {
        let id = defaults.string(forKey: Preferences.UserPreferences.ID.rawValue)
        let first_name = defaults.string(forKey: Preferences.UserPreferences.FirstName.rawValue)
        let last_name = defaults.string(forKey: Preferences.UserPreferences.LastName.rawValue)
        let email = defaults.string(forKey: Preferences.UserPreferences.Email.rawValue)
        let token = defaults.string(forKey: Preferences.UserPreferences.Token.rawValue)
        let locale = defaults.string(forKey: Preferences.ProfilePreferences.Locale.rawValue)

        let profile = Profile(
            locale: locale
        )
        let user = User(
            id: (id! as NSString).integerValue,
            first_name: first_name!,
            last_name: last_name!,
            email: email!,
            token: token!,
            profile: profile
        )
        return user
    }
    
    class func retrieveToken() -> String? {
        if let token = defaults.string(forKey: Preferences.UserPreferences.Token.rawValue) {
            print("Current session token is \(token)")
            return token;
        }
        return nil
    }

}

