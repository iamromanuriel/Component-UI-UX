//
//  DarkMode.swift
//  Components
//
//  Created by Roman Uriel on 20/05/25.
//
import SwiftUI

struct BarDarkMode: View {
    
    @Environment(\.colorScheme) private var colorScheme
    @State var isDarkModeActive: Bool = false
    
    init(colorScheme: ColorScheme, isDarkModeActive: Bool) {
        self.isDarkModeActive = colorScheme == .light
    }
    
    var body: some View {
        NavigationView {
            
            VStack{
                CardBasicForThemeMode()
                Spacer()
            }
            .navigationTitle("Mi Aplicación")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ZStack {
                        Circle()
                            .foregroundColor(.black.opacity(0.2))
                        
                        
                        Image(systemName: self.isDarkModeActive ? "sun.max" : "moon.fill")
                        
                            .padding(8)
                    }.onTapGesture {
                        isDarkModeActive.toggle()
                    }
                    
                }
                
            }
        }
        
    }
    
}

struct CardBasicForThemeMode: View {
    var body: some View {
        VStack{
            HStack{
                ZStack{
                    Circle()
                        .foregroundColor(.green.opacity(0.6))
                    
                    Image(systemName: "person.fill")
                }.frame(width: 44, height: 44)
                
                Text("Robert Ballesteros")
                    .bold()
                Spacer()
            }.padding()
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                .padding(5)
            Spacer().frame(height: 40)
        }
        .background(Color.primary.opacity(0.4))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        
    }
}

#Preview {
    BarDarkMode(colorScheme: .light, isDarkModeActive: false)
}
