//
//  ContentView.swift
//  ShopApp
//
//  Created by Nikita on 17.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var search: String = ""
    
    var body: some View {

        ZStack {
            
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                AppBarView()
                
                TagLineView()
                    .padding()
                
                HStack {
                    HStack {
                        Image("Search")
                            .padding(.trailing, 8)
                        TextField("Search Furniture", text: $search)
                    }
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10)
                    .padding()
                    
                    Image("Scan")
                        .padding()
                        .background(Color("Primary"))
                }
               
            }
        }
        

        
            

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image("menu")
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10)
            }.tint(Color(.white))
            
            Spacer()
            
            Image("Profile")
                .resizable()
                .frame(width: 42, height: 42)
                .cornerRadius(10)
            
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find the \nBest ")
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
        + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold", size: 28))
            .foregroundColor(Color("Primary"))
    }
}
