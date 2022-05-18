//
//  ProfileView.swift
//  Purificator
//
//  Created by Nalinda Gamaarachchi on 5/18/22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authModel: AuthenticationModel
    
    var body: some View {
        VStack {

            signOutButton()
        }
    }
    
    @ViewBuilder
      private func signOutButton() -> some View {
        Button(
          action: {
            authModel.signOut()
          },
          label: {
            Text("Sign Out")
              .bold()
              .font(.footnote)
              .foregroundColor(.white)
              .padding(.vertical, 10)
              .padding(.horizontal, 20)
              .background(
                Capsule()
                  .foregroundColor(.mint)
              )
          }
        )
      }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
