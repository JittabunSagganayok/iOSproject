//
//  LoginScreen.swift
//  buildhouseproject
//
//  Created by pooh on 24/12/2565 BE.
//

import SwiftUI

struct LoginScreen: View {
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack{
            Color(red: 0.80, green: 0.90, blue: 0.99)
                .ignoresSafeArea()
            VStack {
                VStack {
                    VStack {
                        Text("Hello Again!")
                            .foregroundColor(Color.black)    .font(.largeTitle)
                            .fontWeight(.medium)
                            .padding()
                        
                        Text("Welcome to back, You've \nbeen missed")
                            .foregroundColor(Color.gray)    .multilineTextAlignment(.center)
                    }
                    .padding(.bottom)
                    
                    TextField(("Username"), text: $username)
                        .foregroundColor(Color.black)                        .padding(16)
                    
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke()
                                
                        )
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                    
                    TextField(("Password"), text: $password)
                        .foregroundColor(Color.black)        .padding(16)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke()
                        )
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                    
                    HStack {
                        Spacer()
                        Button(action: {}) {
                            Text("Forgot Password?")
                        }
                    }
                    .padding(.trailing, 24)
                    
                    CustomButton()
                    
                    
                    Text("or")
                        .foregroundColor(Color.black)
                    
                    
                    Button(action: {}) {
                        HStack {
                            Spacer()
                            Image("google")
                                .resizable()
                                .frame(width:30,height: 30)
                                .cornerRadius(50.0)
                                .padding(1)
                                .shadow(radius: 10)
                                .padding(.trailing)
                            
                            Text("Login with Google")
                                .foregroundColor(.black)
                            Spacer()
                        }
                    }
                    
                    .padding(12)
                    .background(.white)
                    
                   
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                        )
                    .padding()
                    
                    
                } 
                .padding(.top, 52)
                Spacer()
            }
        }
    }
}


struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}


struct CustomButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Spacer()
                Text("Login")
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .padding()
        .background(.black)
        .cornerRadius(12)
        .padding()
    }
}
