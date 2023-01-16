//
//  CrewView.swift
//  Moonshot
//
//  Created by Edwin Przeźwiecki Jr. on 15/01/2023.
//

/// Challenge 2:

import SwiftUI

struct CrewView: View {
    
    let crew: [MissionView.CrewMember]
    
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
}

struct CrewView_Previews: PreviewProvider {
    
    static var previews: some View {
        CrewView(crew: [])
    }
}
