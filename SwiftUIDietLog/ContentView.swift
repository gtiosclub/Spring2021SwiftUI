//
//  ContentView.swift
//  SwiftUIDietLog
//
//  Created by Tanmoy Panigrahi on 4/24/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var mealMenu = MealMenu()
    @State var name: String = ""
    @State var cals = ""
    
    var entrySpace: some View {
        HStack {
            TextField("Enter in a new meal", text: self.$name)
            TextField("Enter calories", text: self.$cals)
                .padding()
                .keyboardType(.decimalPad)
            
            Button(action: self.addNewDish, label: {
                Text("Add New")
            })
        }
            
        
    }
    
    func addNewDish() {
        mealMenu.menu.append(Meal(id: String(mealMenu.menu.count + 1), name: self.name, cals: self.cals))
        
        self.name = ""
        self.cals = ""
    }
    
    var body: some View {
        NavigationView{
            
            VStack {
                entrySpace.padding()
                
                List {
                    ForEach(self.mealMenu.menu) { meal in
                        Text("Dish:   " + meal.name + "   Cals:"  + meal.cals)
                    }.onMove(perform: self.move)
                    .onDelete(perform: self.delete)
                }.navigationBarTitle("Meal Tracker:")
                .navigationBarItems(trailing: EditButton())
            }
            
        }
        
    }
    
    func move(from source : IndexSet, to destination : Int) {
        mealMenu.menu.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets: IndexSet) {
        mealMenu.menu.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
