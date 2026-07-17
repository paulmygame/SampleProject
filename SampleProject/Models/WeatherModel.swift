//
//  WeatherModel.swift
//  SampleProject
//
//  Created by Paul Eduard Lapiceros on 7/15/26.
//

import Foundation

struct WeatherResponse: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let humidity: Int
}

struct Weather: Codable {
    let description: String
    let icon: String
}
