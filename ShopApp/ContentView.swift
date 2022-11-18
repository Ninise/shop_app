//
//  ContentView.swift
//  ShopApp
//
//  Created by Nikita on 17.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedIndex: Int = 0
    	 	 
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    
    var body: some View {

        ZStack {
            
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                AppBarView()
                
                TagLineView()
                    .padding()
                
                SearchAndScanView()
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0 ..< categories.count) { i in
                            CategoryView(isActive: i == selectedIndex, text: categories[i])
                                .onTapGesture {
                                    selectedIndex = i
                                }
                        }
                    }
                }
                .padding()
               
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

struct SearchAndScanView: View {
    @State private var search: String = ""

    
    var body: some View {
        HStack {
            HStack {
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
            }
            .padding(.all, 20)
            .background(Color(.white))
            .cornerRadius(10)
            .padding(.trailing)
            
            Button(action: {}) {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    
    let isActive: Bool
    let text: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary") : Color.black.opacity(0.5))
            
            if (isActive == true) {
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}
