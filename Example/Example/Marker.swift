//
//  Marker.swift
//  Example
//
//  Created by Saika Natsui on 2021/08/31.
//  Copyright © 2021 FidelityWires. All rights reserved.
//

import Foundation

struct Marker {
    let latidude: Double
    let longitude: Double
    let title: String
    let snippet: String
}

let markers: [Marker] = [
    .init(
        latidude: 35.665443081388474,
        longitude: 139.71382311707598,
        title: "BB Cafe",
        snippet: "SSID: xxxx_xxxx"),
    .init(
        latidude: 35.66594436363295,
        longitude: 139.71083919797994,
        title: "Radio Tower",
        snippet: "SSID: xxxx_xxxx"),
    .init(
        latidude: 35.66479387511549,
        longitude: 139.7116281664189,
        title: "A Store",
        snippet: "SSID: xxxx_xxxx"),
    .init(
        latidude: 35.66559100106665,
        longitude: 139.7096557453215,
        title: "B Store",
        snippet: "SSID: xxxx_xxxx"),
    .init(
        latidude: 35.66490070689039,
        longitude: 139.71276104417743,
        title: "Flower Market",
        snippet: "SSID: xxxx_xxxx"),
]
