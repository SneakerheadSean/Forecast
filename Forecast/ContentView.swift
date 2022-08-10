//
//  ContentView.swift
//  Forecast
//
//  Created by Sean Hughes on 8/8/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                
                CityTextView(cityName: "Cupertino, CA")
                MainWeatherStatusView(imageName: "cloud.sun.fill", temp: 76)
               
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "Tue", imageName: "cloud.sun.fill", temp: 74)
                    WeatherDayView(dayOfWeek: "Wed", imageName: "sun.haze.fill", temp: 84)
                    WeatherDayView(dayOfWeek: "Thu", imageName: "cloud.bolt.rain.fill", temp: 71)
                    WeatherDayView(dayOfWeek: "Fri", imageName: "wind.snow", temp: 34)
                    WeatherDayView(dayOfWeek: "Sat", imageName: "cloud.sun.rain.fill", temp: 64)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                }label: {
                    Text("Change Time of Day")
                        .frame(width: 280, height: 50)
                        .background(Color.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10.0)
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
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : .yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}


struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
