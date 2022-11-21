//
//  DetailsScreen.swift
//  ShopApp
//
//  Created by Nikita on 21.11.2022.
//

import SwiftUI

struct DetailsScreen: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                Image("chair_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                
                
                DescriptionView()
                    .offset(y: -40)
                
                
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack {
                Text("$1299")
                    .font(.title)
                    .foregroundColor(Color.white)
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("Add to Cart")
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(Color("Primary"))
                })
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(50, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
            
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                CustomBackButtonView(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image("threeDot")
                                    
        )
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen()
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Luxery Swedish \nChair")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            
            HStack (spacing: 4) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Text("4.9")
                    .foregroundColor(Color.black)
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            
            Text("Description")
                .foregroundColor(Color.black)
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text("Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown ...")
                .foregroundColor(Color.black)
                .lineSpacing(8)
                .opacity(0.6)
            
            HStack (alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                        .foregroundColor(Color.black)
                    Text("Height: 120cm")
                        .opacity(0.6)
                        .foregroundColor(Color.black)
                    Text("Wide: 80cm")
                        .opacity(0.6)
                        .foregroundColor(Color.black)
                    Text("Diameter: 72cm")
                        .opacity(0.6)
                        .foregroundColor(Color.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("Treament")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                        .foregroundColor(Color.black)
                    
                    Text("Jati Wood, Canvas \nAmazing Love")
                        .foregroundColor(Color.black)
                        .opacity(0.6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

            }
            .padding(.vertical)
            
            
            HStack (alignment: .bottom) {
                VStack (alignment: .leading) {
                    Text("Colors")
                        .foregroundColor(Color.black)
                        .fontWeight(.semibold)
                    
                    HStack {
                        ColorDotView(color: .white)
                        ColorDotView(color: .black)
                        ColorDotView(color: Color("Primary"))
                    }
                }
                
                Spacer()
                
                VStack (alignment: .leading) {
                    Text("Quantity")
                        .foregroundColor(Color.black)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Button(action: {}, label: {
                            Image(systemName: "minus")
                                .padding(.all, 8)
                        })
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerSize: CGSize(width: 50, height: 50)).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                            .foregroundColor(Color.black)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        
                        Button(action: {}, label: {
                            Image(systemName: "plus")
                                .padding(.all, 8)
                            
                        })
                        .background(Color("Primary"))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    }
                }
                
            }
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(40)
    }
}

struct ColorDotView: View {
    
    let color: Color
    
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct CustomBackButtonView: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "chevron.backward")
                .padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
                .foregroundColor(Color.black)
        })
    }
}
