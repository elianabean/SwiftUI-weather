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
            LinearGradient(gradient: Gradient(colors: [.blue, Color("Light Blue")]),
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
                VStack(spacing: 10) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode:.fit) //keeps the ratio of the image, but you can resize the frame
                        .frame(width:180,height: 180)
                    Text("76°")
                        .font(.system(size:70, weight:.medium))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40) //padding under the VStack
                
                
                HStack (spacing:20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 88)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 55)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 60)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 25)
                }
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

struct WeatherDayView: View {
    //when you create a WeatherDayView, you have to pass in these things
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size:16,  weight:.medium,  design:.default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original) //keeps the orig colors
                .resizable()
                .aspectRatio(contentMode:.fit) //keeps the ratio of the image, but you can resize the frame
                .frame(width:40,height: 40)
            
            Text("\(temperature)°") //converting "temperature" to a string
                .font(.system(size:28, weight:.medium))
                .foregroundColor(.white)
        }
    }
}
