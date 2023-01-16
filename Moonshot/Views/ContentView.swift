//
//  ContentView.swift
//  Moonshot
//
//  Created by Edwin Przeźwiecki Jr. on 12/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    /// Challenge 3:
    @AppStorage("ViewType") private var showingGrid = true
    
    var body: some View {
        NavigationView {
            /// Challenge 3:
            Group {
                if showingGrid {
                    GridLayout(missions: missions, astronauts: astronauts)
                } else {
                    ListLayout(missions: missions, astronauts: astronauts)
                }
            }
            /// Challenge 3:
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingGrid.toggle()
                    } label: {
                        Label(showingGrid ? "List View" : "Grid View", systemImage: showingGrid ? "list.dash" : "square.grid.2x2")
                    }
                    .foregroundColor(.white)
                }
            }
            .navigationTitle("Moonshot")
        }
        .preferredColorScheme(.dark)
    }
    
    /// Challenge 3:
    func toggleView() {
        showingGrid.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
