//
//  ProfileView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Leon Grimmeisen on 05.07.22.
//

import SwiftUI

struct ProfileView: View {
    
    // app storage
    @AppStorage("name") var currentUserName : String?
    @AppStorage("age") var currentUserAge : Int?
    @AppStorage("gender") var currentUserGender : String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            Text(currentUserName ?? "Your name here")
            Text("This user is \(currentUserAge ?? 0) years old")
            Text("There gender is \(currentUserGender ?? "unknown")")
            
            Text("Sign out")
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(10)
                .onTapGesture {
                    signOut()
                }

        }
        .font(.title)
        .foregroundColor(.purple)
        .padding()
        .padding(.vertical, 40)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
    
    func signOut() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        withAnimation(.spring()) {
            currentUserSignedIn = false
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
