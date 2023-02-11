//
//  MissionView.swift
//  Moonshot
//
//  Created by Edwin Przeźwiecki Jr. on 13/01/2023.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember {
        let astronaut: Astronaut
        let role: String
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    /// Challenge 2:
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    /// Project 15, challenge 3:
                    Image(decorative: mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                        .accessibilityElement()
                        .accessibilityLabel(mission.badge)
                    
                    /// Challenge 1:
                    /* Text(mission.formattedLaunchDate)
                        .font(.title.monospacedDigit())
                        .padding(.top) */
                    
                    /// More aesthetic solution:
                    if let date = mission.launchDate {
                        Label(date.formatted(date: .complete, time: .omitted), systemImage: "calendar")
                            .padding(.top)
                        /// Project 15, challenge 3:
                            .accessibilityLabel("Mission flew on \(date.formatted(date: .complete, time: .omitted))")
                    } else {
                        Text("N/A")
                            .font(.title.monospacedDigit())
                            .padding(.top)
                        /// Project 15, challenge 3:
                            .accessibilityLabel("Mission never flew")
                    }
                    
                    VStack(alignment: .leading) {
                        /// Challenge 2:
                        DividerView()
                        
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                        
                        /// Challenge 2:
                        DividerView()
                        
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    /// Challenge 2:
                    CrewView(crew: crew)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(astronaut: astronaut, role: member.role)
            } else {
                fatalError("\(member.name)")
            }
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
