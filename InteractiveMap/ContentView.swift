//
//  ContentView.swift
//  InteractiveMap
//
//  Created by Amitesh Nagarkar on 28/06/2020.
//  Copyright © 2020 Amitesh Nagarkar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //Text("Hello, World!")
        MapView()
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
       
    }
}
