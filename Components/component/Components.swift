//
//  Components.swift
//  Components
//
//  Created by Roman Uriel on 16/05/25.
//
import SwiftUI

struct ScreenSearch: View {
    var body: some View {
        VStack{
            SelectorItems()
            Spacer()
        }
    }
}


struct SelectorItems: View {
    @State var options = ["Nombre", "Persona", "Evento"]
    @State private var selectedIndex = 0
    @State private var shakeTrigger: Bool = false
    @Namespace private var selectionAnimation

    var body: some View {
        VStack{
            
            CallSelectorSearch(label: $options[selectedIndex])
            
            HStack(spacing: 0) {
                ForEach(options.indices, id: \.self) { index in
                    HStack {
                        Text(options[index])
                            .contentShape(Rectangle())
                            

                        if selectedIndex == index {
                            Image(systemName: "checkmark.circle")
                        }
                    }
                    .frame(width: 120, height: 40)
                    .background(alignment: .center) {
                        if selectedIndex == index {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.blue.opacity(0.2))
                                .matchedGeometryEffect(id: "selectionBackground", in: selectionAnimation)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.4)) {
                            selectedIndex = index
                            shakeTrigger.toggle()
                        }
                    }
                }
            }
        }
    }
}

struct CallSelectorSearch: View {
    @Binding var label: String
    @FocusState private var isFocused: Bool
    @State var text: String = ""
    @State var animateLabel: Bool = false
    
    var body: some View {
        VStack{
            
            HStack{
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(6)
                        
                    TextField(label, text: $text)
                        .focused($isFocused)
                        .padding(.vertical, 8)
                        .animation(
                            Animation.easeInOut(duration: 0.8),
                            value: isFocused
                        )
                    
                }
                
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding()
                
                if(isFocused){
                    withAnimation(.easeIn.delay(0.8)){
                        Button(action:{
                            if(text.isEmpty){
                                isFocused = false
                            }else{
                                text = ""
                            }
                            
                        }){
                            Text( text.isEmpty ? "Cancelar" : "Eliminar")
                            
                        }
                        .padding(8)
                    }
                }
            }
            
        }
        
    }
}


#Preview {
    ScreenSearch()
}
