//
//  ExploreView.swift
//  Headspacey
//
//  Created by Shriya on 4/22/24.
//

import SwiftUI

struct ExploreNavView: View {
    @Binding var isFavorited: Bool
    var body: some View {
        NavigationView {
            ExploreView(isFavorited: $isFavorited)
        }
    }
}

struct ExploreView: View {
    @State private var searchText = ""
    @Binding var isFavorited: Bool
        var body: some View {
            ScrollView {
                ZStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                            CustomTextField("Search meditations", text: $searchText)
                                .padding(8)
                                .background(backgroundBlue) // Background color
                                .foregroundColor(.white) // Text color
                                .font(.system(size: 20))
                        }
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color(red: 42/255, green: 45/255, blue: 85/255), lineWidth: 2.5) // Border
                        )
                        .padding([.leading, .trailing], 10)
                        HStack {
                            NavigationLink(destination: ItemDetailView(item: SectionItem(title: "Meditation and Work", typeImage: "speaker.wave.3", type: "Today's Meditation", duration: "3-20 min", imageName: "meditation", description: "Build your practice with a new meditation each day. Each session is unique.", isFaved: false), isFavorited: $isFavorited), label: {
                                Image("meditate")
                                    .resizable()
                                    .frame(width: 180, height: 80)
                            })
                            .padding([.leading, .top], 10)
                            Spacer()
                            NavigationLink(destination: ItemDetailView(item: SectionItem(title: "Release Tension", typeImage: "music.quarternote.3", type: "Sleep Music", duration: "90 min", imageName: "tension", description: "Developed using Al technology designed to help shift your mood, this track will help you slowly unwind and release tension for a good night's sleep.", isFaved: false), isFavorited: $isFavorited), label: {
                                Image("sleep")
                                    .resizable()
                                    .frame(width: 180, height: 80)
                            })
                            .padding([.trailing, .top], 10)
                        }
                        HStack {
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image("move")
                                    .resizable()
                                    .frame(width: 180, height: 80)
                            })
                            .padding([.leading, .top], 10)
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image("music")
                                    .resizable()
                                    .frame(width: 180, height: 80)
                            })
                            .padding([.trailing, .top], 10)
                        }
                        Button(action: {}, label: {
                            Image("podcasts")
                                .resizable()
                                .frame(width: 370, height: 70)
                        })
                        .padding(10)
                        .cornerRadius(10)
                        Button(action: {}, label: {
                            Image("popular")
                                .resizable()
                                .frame(width: 370, height: 70)
                        })
                        .padding([.leading, .trailing, .bottom], 10)
                        .cornerRadius(10)
                        Button(action: {}, label: {
                            Image("beginning")
                                .resizable()
                                .frame(width: 370, height: 70)
                        })
                        .padding([.leading, .trailing, .bottom], 10)
                        .cornerRadius(10)
                    }
                    
                }
                
            }
            .padding(.top, 70)
            .background(backgroundBlue)
            .edgesIgnoringSafeArea(.all)
        }
}

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    
    init(_ placeholder: String, text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(red: 117/255, green: 128/255, blue: 163/255)) // Placeholder color
                    .font(.system(size: 20))
                    .fontWeight(.light)
                    .padding(.horizontal, 8)
            }
            TextField("", text: $text)
                .font(.system(size: 20))
                .padding(.horizontal, 8)
        }
    }
}



struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        let isFavorited = Binding.constant(false)
        return ExploreNavView(isFavorited: isFavorited)
    }
}
