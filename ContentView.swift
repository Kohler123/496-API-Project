//
//  ContentView.swift
//  FetchAPI
//
//  Created by SI CHEN on 10/03/22.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var apiData:APIData = APIData(Title: "Fast")
    @State var Title: String = ""
    @State var Year: String = ""
    @State var imdbID: String = ""
    @State var Poster:String = ""

    var body: some View {
        VStack {
            Image(String(""))
            Text("Title:" + self.Title)
                .padding()
            Text("Year:" + String(self.Year))
                .padding()
            Text("IMDB ID:" + String(self.imdbID))
                .padding()
            TextField("Title", text: $Title)
                .multilineTextAlignment(.center).padding(6.0)
                    .background(RoundedRectangle(cornerRadius: 4.0, style: .continuous)
                                  .stroke(.gray, lineWidth: 1.0))
                    .padding()
            Button("Search") {
                
                self.Title = String(Title)
                apiData.fetchNew(Title: self.Title)
                self.Year = apiData.year
                self.imdbID = apiData.imdbID
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }

}
