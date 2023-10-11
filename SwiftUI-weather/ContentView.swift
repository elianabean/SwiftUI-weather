//
//  ContentView.swift
//  SwiftUI-weather
//
//  Created by Eliana Wang on 7/24/23.
//
// Using Sean Allen tutorial: https://youtu.be/HXoVSbwWUIk?si=yvGv_ft5Ql_JDLKo 

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight) //$ makes it binding. it passes in the isNight in ContentView as a parameter to isNight in BackgroundView
            // colors: [array of colors]
            //edgesIgnoringSafeArea(.all) will cover the ENTIRE screen
            //ternary operators: (condition) ? (if true) : (if false)
            
            VStack {
                CityTextView(cityName: "Cuppertino, California")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                
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
                
                Button {
                    //action
                    isNight.toggle()
                    
                } label: {
                    //what the button looks like
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer() //spacer counts as a view. you can have 10 views in total in 1 page (nested views count as 1)
                    
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

struct BackgroundView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            //the order of modifiers matters
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white) //text color
            .padding()
        
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode:.fit) //keeps the ratio of the image, but you can resize the frame
                .frame(width:180,height: 180)
            Text("\(temperature)°")
                .font(.system(size:70, weight:.medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40) //padding under the VStack
    }
}

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width:200, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size:20, weight:.bold, design:.default))
            .cornerRadius(10.0)
    }
}
