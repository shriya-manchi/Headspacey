//
//  ContentView.swift
//  Headspacey
//
//  Created by Shriya on 4/15/24.
//

import SwiftUI

let backgroundBlue: Color = Color(red: 5/255, green: 7/255, blue: 38/255)
let lighterBlue: Color = Color(red: 16/255, green: 19/255, blue: 64/255)
let grayText: Color = Color(red: 157/255, green: 165/255, blue: 184/255)


struct ContentView: View {
    @Binding var isFavorited: Bool
    var body: some View {
        TabView {
            TodayView()
                .tabItem() {
                    Image(systemName: "house.fill")
                    Text("Today")
                }
            ExploreView(isFavorited: $isFavorited)
                .tabItem() {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Explore")
                }
            ProfileView()
                .tabItem() {
                    Image(systemName: "person.fill")
                    Text("Shriya")
                }
        }
        .accentColor(.white)
        .background(backgroundBlue)
    }
}


struct TodayView: View {
    @State private var isFavorited: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // Header
                    HeaderView()
                    
                    // Start your day section
                    SectionView(
                        title: "Start your day",
                        items: [
                            SectionItem(title: "Everyday Mindfulness", typeImage: "play.rectangle", type: "Video", duration: "2 min", imageName: "ed_mindful", description: "Discover the Today tab, and how Headspace makes it easy to return to your mindfulness practice throughout from morning to bedtime.", isFaved: isFavorited),
                            
                            SectionItem(title: "Everyday Gratitude", typeImage: "speaker.wave.3", type: "Meditation", duration: "4 min", imageName: "gratitude", description: "Practicing gratitude can help us notice the things in our lives that make us happy, so we can stay in a place of positivity and well-being.", isFaved: isFavorited),
                            
                            SectionItem(title: "Meditation and Work", typeImage: "speaker.wave.3", type: "Today's Meditation", duration: "3-20 min", imageName: "meditation", description: "Build your practice with a new meditation each day. Each session is unique.", isFaved: isFavorited)
                        ], isFavorited: $isFavorited
                    )
                    // Your afternoon lift section
                    SectionView(
                        title: "Your afternoon lift",
                        items: [
                            SectionItem(title: "Anxiety, My Old Friend", typeImage: "speaker.wave.3", type: "Podcast", duration: "7 min", imageName: "anxiety", description: "How you relate to anxiety is up to you. Today, Dora walks us through letting go of anxious thoughts.", isFaved: isFavorited),
                            
                            SectionItem(title: "Focus for Work", typeImage: "speaker.wave.3", type: "Meditation", duration: "10-12 min", imageName: "focus", description: "Recognize distraction and experience a more relaxed kind of focus.", isFaved: isFavorited)
                        ], isFavorited: $isFavorited
                    )
                    // At night section
                    SectionView(
                        title: "At night",
                        items: [
                            SectionItem(title: "Moonrise Meadow", typeImage: "speaker.wave.3", type: "Wind Down", duration: "45 min", imageName: "moonrise", description: "Nestled in the plush flowers and soft grass, this lush superbloom is the perfect place to stop and rest. Release tension in your mind and body with a guided muscle relaxation technique.", isFaved: isFavorited),
                            
                            SectionItem(title: "Release Tension", typeImage: "music.quarternote.3", type: "Sleep Music", duration: "90 min", imageName: "tension", description: "Developed using Al technology designed to help shift your mood, this track will help you slowly unwind and release tension for a good night's sleep.", isFaved: isFavorited)
                        ], isFavorited: $isFavorited
                    )
                }
            }
            .background(backgroundBlue.ignoresSafeArea())
        }
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("Good Evening, Shriya")
                .font(.system(size: 17))
                .fontWeight(.light)
                .foregroundColor(.white)
            Spacer()
            NavigationLink(destination: FavoritesView()) {
                Image(systemName: "heart")
                    .resizable()
                    .frame(width: 20, height: 18)
                    .padding(.trailing, 10)
                    .foregroundColor(.white)
            }
            NavigationLink(destination: RecentView()) {
                Image(systemName: "clock.arrow.circlepath")
                    .resizable()
                    .frame(width: 21, height: 18)
                    .foregroundColor(.white)
            }
        }
        .padding([.top, .leading, .trailing], 20)
    }
}


struct SectionView: View {
    let title: String
    let items: [SectionItem]
    @Binding var isFavorited: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {
            Text(title)
                .font(.system(size: 23))
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding([.leading], 20)
                .padding([.top], 30)
            ForEach(items, id: \.self) { item in
                CircleItemView(item: item, isFavorited: $isFavorited)
            }
        }
    }
}

struct ItemContent: View {
    let item: SectionItem
    @Binding var isFavorited: Bool
    
    var body: some View {
        NavigationLink(destination: ItemDetailView(item: item, isFavorited: $isFavorited)) {
            ZStack {
                Rectangle()
                    .foregroundColor(lighterBlue)
                    .cornerRadius(10)
                    .frame(width: 325, height: 150)
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .fontWeight(.bold)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        HStack {
                            Image(systemName: item.typeImage)
                                .resizable()
                                .frame(width: 13, height: 11)
                                .fontWeight(.bold)
                                .foregroundColor(grayText)
                            Text(item.type)
                                .font(.system(size: 12))
                                .foregroundColor(grayText)
                        }
                        Text(item.duration)
                            .font(.system(size: 12))
                            .foregroundColor(grayText)
                        EllipsisView()
                    }
                    Spacer()
                    Image(item.imageName)
                        .resizable()
                        .frame(width: 140, height: 90)
                        .cornerRadius(8)
                }
                .frame(width: 300)
            }
        }
    }
}


struct CircleItemView: View {
    let item: SectionItem
    @Binding var isFavorited: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            CircleFill()
            ItemContent(item: item, isFavorited: $isFavorited)
        }
    }
}

struct SectionItem: Hashable {
    let title: String
    let typeImage: String
    let type: String
    let duration: String
    let imageName: String
    let description: String
    let isFaved: Bool
}

struct EllipsisView: View {
    @State private var isPopoverPresented = false
    
    var body: some View {
        VStack {
            Button(action: {
                isPopoverPresented.toggle()
            }) {
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(backgroundBlue)
                    Image(systemName: "ellipsis")
                        .foregroundColor(.white)
                }
            }
        }
        .popover(isPresented: $isPopoverPresented) {
            VStack {
                Button(action: {
                    // Action for favorites button
                }) {
                    Label("Add to Favorites", systemImage: "heart")
                        .foregroundColor(.white)
                        .padding()
                }
                ShareLink(item: "Fakeeee")
                    .foregroundColor(.white)
                    .padding()
            }
            .presentationCompactAdaptation(.popover)
            .background(lighterBlue)
            .border(Color.black)
        }
    }
}

struct CircleFill: View {
    
    @State var fill: Color = Color.orange
    
    var body: some View {
        Circle()
            .fill(fill)
            .frame(width: 20, height: 20)
            .padding(.leading, 15)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isFavorited: .constant(false))
    }
}

