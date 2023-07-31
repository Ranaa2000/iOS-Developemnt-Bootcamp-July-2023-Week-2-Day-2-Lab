//
//  ContentView.swift
//  lab2Week 2
//
//  Created by Rana MHD on 13/01/1445 AH.
//

import SwiftUI

struct DataCard : Identifiable  {
    var id: UUID = UUID()
    let title : String
    let imageURL :String
}

// Task 4
struct ImageCard: View {
    var imageUrl: String

    var body: some View {
        AsyncImage(url: URL(string: imageUrl)){
            result in
                if let image = result.image {
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                } else {
                    Rectangle()
                        .fill(Color.black.opacity(0.1))
                }
        }
    }
}

struct ContentView: View {
    @State private var showOrangeCar = true
    @State private var isDarkMode = false

    let cards : Array<DataCard> = [
        DataCard(title: "Car", imageURL: "https://source.unsplash.com/200x200/?car"
        ),
        DataCard(title: "Flower", imageURL: "https://source.unsplash.com/200x200/?flower"
        ),
        DataCard(title: "Garden", imageURL:"https://source.unsplash.com/200x200/?garden"
        ),
        DataCard(title: "Lake", imageURL:"https://source.unsplash.com/200x200/?lake"
        ),
    ]

    var body: some View {
        VStack {
            // Task 1
            Text("Sport Cars")
                .font(.system(.largeTitle))
                .foregroundColor(Color(.darkGray))
                .frame(maxWidth:.infinity, alignment: .leading)
            HStack {
                Text("Red")
                    .padding()
                Image("RedCar")
                    .resizable()
                    .scaledToFit()
                    .padding(25)
            }
            HStack {
                Text("Blue")
                    .padding()
                Image("BlueCar")
                    .resizable()
                    .scaledToFit()
                    .padding(30)
            }
            HStack {
                Text("Orange")
                    .padding()
                Image("OrangeCar")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            .opacity(showOrangeCar ? 0.8 : 0)

            // Task 2
            Button(
                action: {
                    withAnimation(.easeInOut(duration: 2)) {
                        self.showOrangeCar.toggle()
                    }
                }
            )
            {
                if showOrangeCar {
                    Text("Hide Orange Car")
                        .font(.title)
                        .bold()
                } else {
                    Text("Show Orange Car")
                        .font(.title)
                        .bold()
                }
                
            }
            .buttonStyle(.borderedProminent)
            
            // Task 3
            ScrollView(.horizontal){
                HStack {
                    ForEach(cards) {
                        card in
                        ImageCard(imageUrl: card.imageURL)
                    }
                }
            }
            
            // Task 5
            Button(action: {
                isDarkMode.toggle()
            }, label: {
                if(isDarkMode) {
                    Text("Light Mode")
                } else {
                    Text("Dark Mode")
                }
            })
        }.preferredColorScheme(isDarkMode ? .dark : .light)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
