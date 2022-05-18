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
    @State private var isLogInShown = true
    
    var body: some View {
        VStack {
            Text("Welcome to Purificator")
                .font(.system(size: 50).bold())
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: getRect().height /  3.5)
                .padding() 
                .background(
                    ZStack {
                        // Gradiant Circle
                        // Need maching colors
                        LinearGradient(colors: [Color("Bg"), Color("Primary")], startPoint: .top, endPoint: .bottom)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .padding(.trailing)
                            .offset(y: -25)
                            .ignoresSafeArea()
                        
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                            .frame(width: 30, height: 30)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            .padding(30)
                        
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3),lineWidth: 3)
                            .frame(width: 23, height: 23)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding(.leading, 30)
                    }
                )
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                inputFields()
                
                Button {
                    withAnimation {
                        isLogInShown.toggle()
                    }
                } label: {
                    Text(isLogInShown ? "don't have a account" : "have a account")
                        .font(.system(size: 15).bold())
                        .foregroundColor(Color("Primary"))
                }
                .padding(.top, 12)
                
                if(isLogInShown) {signInButton()} else {signUpButton()}
            }
                .padding(30)
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Bg"))
            .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25))
            .ignoresSafeArea()
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Primary"))

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
                .font(.system(size: 17).bold())
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color("Primary"))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 5, y: 5)
        }
      )
      .padding(.top, 25)
      .padding(.horizontal)
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
                .font(.system(size: 17).bold())
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color("Primary"))
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 5, y: 5)
        }
      )
      .padding(.top, 25)
      .padding(.horizontal)
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
