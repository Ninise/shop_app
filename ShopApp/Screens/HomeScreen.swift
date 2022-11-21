//
//  HomeScreen.swift
//  ShopApp
//
//  Created by Nikita on 21.11.2022.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var selectedIndex: Int = 0
              
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    
    var body: some View {
        ZStack {
            
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
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
                        .padding()
                    }
                    
                    Text("Popular")
                        .font(.custom("PlayfairDisplay-Bold", size: 24))
                        .padding(.horizontal)
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image: Image("chair_\(index + 1)"), size: 210)
                            }
                            .padding(.trailing)
                        }
                        .padding(.leading)
                    }
                    
                    Text("Best")
                        .font(.custom("PlayfairDisplay-Bold", size: 24))
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image: Image("chair_\(index + 1)"), size: 180)
                            }
                            .padding(.trailing)
                        }
                        .padding(.leading)
                    }
                    
                }
            }
            
            // Custom bottom Nav bar
            
            BottomNavBar()
            
        }
    }
}


struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
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

struct ProductCardView: View {
    
    let image:Image
    let size: CGFloat
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20)
            
            Text("Luxery Swedish chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack (spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                
                Spacer()
                
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct BottomNavBarItem: View {
    
    let image: Image
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            image
                .frame(maxWidth: .infinity)
        })
    }
}

struct BottomNavBar: View {
    var body: some View {
        HStack {
            BottomNavBarItem(image: Image("Home")) {}
            BottomNavBarItem(image: Image("fav")) {}
            BottomNavBarItem(image: Image("shop")) {}
            BottomNavBarItem(image: Image("User")) {}
        }
        .padding()
        .background(Color.white)
        .clipShape(Capsule())
        .padding(.horizontal)
        .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}


