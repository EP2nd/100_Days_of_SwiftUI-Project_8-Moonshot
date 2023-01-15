//
//  CrewView.swift
//  Moonshot
//
//  Created by Edwin Przeźwiecki Jr. on 15/01/2023.
//

/// Challenge 2:

import SwiftUI

struct CrewView: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack(spacing: -10) {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 149.76, height: 103.68)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .strokeBorder(crewMember.role == "Commander" || crewMember.role == "Command Pilot" ? .yellow : .gray, lineWidth: 2)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.leading)
                        }
                        .padding(.trailing)
                    }
                }
            }
        }
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("\(member.name)")
            }
        }
    }
}

struct CrewView_Previews: PreviewProvider {
    
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        CrewView(mission: missions[0], astronauts: astronauts)
    }
}
