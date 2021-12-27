//
//  ContentView.swift
//  DailyForexProject
//
//  Created by Jithin on 27/12/21.
//

import SwiftUI

struct ForexList: View {
    @StateObject private var forexData = ForexDataModel()
    var body: some View {
         forexData.isLoading ? Text("Loading...") : Text("No data")
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForexList()
    }
}
