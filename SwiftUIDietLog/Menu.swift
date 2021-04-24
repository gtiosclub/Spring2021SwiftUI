//
//  Menu.swift
//  SwiftUIDietLog
//
//  Created by Tanmoy Panigrahi on 4/24/21.
//

import Foundation
import Combine

struct Meal: Identifiable {
    var id = String()
    var name = String()
    var cals = String()
}

class MealMenu : ObservableObject {
    @Published var menu = [Meal]()
}
