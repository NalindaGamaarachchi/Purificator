//
//  LoginView.swift
//  Purificator
//
//  Created by Nalinda Gamaarachchi on 5/15/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @EnvironmentObject var authModel: AuthenticationModel
    @State private var isHomeShown = false
    
    var body: some View {
        inputFields()
        signUpButton()
        signInButton()
    }
    
    @ViewBuilder
    private func inputFields() -> some View {
      VStack(alignment: .center, spacing: 16) {
        TextField(
          "Email Address",
          text: $emailAddress
        )
        .textContentType(.emailAddress)
        .textInputAutocapitalization(.never)
        .keyboardType(.emailAddress)
        .padding()
        .background(Color.white)
        .clipShape(Capsule())

        SecureField(
          "Password",
          text: $password
        )
        .textContentType(.password)
        .textInputAutocapitalization(.never)
        .padding()
        .background(Color.white)
        .clipShape(Capsule())
      }
      .padding(.horizontal)
    }
    
    @ViewBuilder
    private func signUpButton() -> some View {
      Button(
        action: {
          authModel.signUp(
            emailAddress: emailAddress,
            password: password
          )
        },
        label: {
          Text("Sign Up")
            .bold()
            .foregroundColor(.black)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.regularMaterial)
            .clipShape(Capsule())
            .padding(.horizontal)
        }
      )
    }

    @ViewBuilder
    private func signInButton() -> some View {
      Button(
        action: {
          authModel.signIn(
            emailAddress: emailAddress,
            password: password
          )
        },
        label: {
          Text("Sign In")
            .bold()
            .foregroundColor(.black)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.regularMaterial)
            .clipShape(Capsule())
            .padding(.horizontal)
        }
      )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
