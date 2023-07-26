//
//  ContentView.swift
//  SwiftUI-weather
//
//  Created by Eliana Wang on 7/24/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            // colors: [array of colors]
            //edgesIgnoringSafeArea(.all) will cover the ENTIRE screen
            
            VStack {
                Text("Cupertino, CA")
                    //the order of modifiers matters
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white) //text color
                    .padding()
                Spacer()
                    
            }
            
            
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
