//
//  ItemView.swift
//  Headspacey
//
//  Created by Shriya on 4/17/24.
//

import SwiftUI

struct ItemDetailView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var isToggled = false
    @State private var isPopoverPresented = false
    @StateObject private var viewModel: ItemDetailViewModel
    @Binding var isFavorited: Bool
    
    let item: SectionItem
    
    init(item: SectionItem, isFavorited: Binding<Bool>) {
        self.item = item
        self._isFavorited = isFavorited // Initialize the binding
        _viewModel = StateObject(wrappedValue: ItemDetailViewModel(isFavorited: item.isFaved))
    }

    var body: some View {
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                VStack(alignment: .leading) {
                    // Display the image of the item
                    Image(item.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.leading, .trailing], 10)
                        .cornerRadius(20)
                    
                    // Display the title of the item
                    VStack(alignment: .leading) {
                        HStack {
                            Text(item.title)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .fontWidth(.condensed)
                            Spacer()
                            Button(action: {
                                viewModel.isFavorited.toggle()
                            }, label: {
                                Image(systemName: viewModel.isFavorited ? "heart.fill" : "heart")
                                    .resizable()
                                    .frame(width: 22, height: 20)
                                    .fontWeight(.bold)
                                    .foregroundColor(viewModel.isFavorited ? .red : .gray)
                                    .padding(.trailing, 20)
                                    .padding(.top, 8)
                            })
                            Button(action: {
                                isPopoverPresented.toggle()
                            }, label: {
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .frame(width: 17, height: 23)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.trailing, 10)
                                    .padding(.top, 5)
                            })
                            .popover(isPresented: $isPopoverPresented) {
                                VStack {
                                    ShareLink(item: "Fakeeee")
                                        .foregroundColor(.white)
                                        .padding(30)
                                }
                                .presentationCompactAdaptation(.popover)
                                .background(lighterBlue)
                                .edgesIgnoringSafeArea(.all)
                                .border(Color.black)
                            }
                        }
                        .padding(.top, 13)
                        Spacer()
                        VStack {
                            VStack(alignment: .leading) {
                                HStack {
                                    Image(systemName: "\(item.typeImage)")
                                        .resizable()
                                        .frame(width: 15, height: 12)
                                        .bold()
                                    Text("\(item.type) • \(item.duration)")
                                        .font(.system(size: 12))
                                        .fontWeight(.semibold)
                                }
                                .padding(.bottom, 13)
                                Text(item.description)
                                    .lineSpacing(6)
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(grayText)
                            Button(action: {}, label: {
                                HStack {
                                    Image(systemName: "play.fill")
                                    Text("Play")
                                }
                                .foregroundStyle(.white)
                                .padding([.trailing, .leading], 140)
                                .padding([.top, .bottom], 14)
                                .background(Color(red: 6/255, green: 80/255, blue: 255/255))
                                .cornerRadius(30)
                                .bold()
                                
                            })
                            .padding(.top, 170)
                        }
                    }
                    .padding([.leading, .trailing], 25)
                }
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 60)
                            .foregroundColor(backgroundBlue)
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                .padding(.leading, 20)
                .padding(.top, 15)
            }
        }
        .padding(.top, 60)
        .background(backgroundBlue)
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
}


class ItemDetailViewModel: ObservableObject {
    @Published var isFavorited: Bool
    
    init(isFavorited: Bool) {
        self.isFavorited = isFavorited
    }
}

    
struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let isFavorited = Binding<Bool>(
            get: { false },
            set: { _ in }
        )
        return ItemDetailView(item: SectionItem(title: "Moonrise Meadow", typeImage: "speaker.wave.3", type: "Wind Down", duration: "45 min", imageName: "moonrise", description: "Nestled in the plush flowers and soft grass, this lush superbloom is the perfect place to stop and rest. Release tension in your mind and body with a guided muscle relaxation technique.", isFaved: false), isFavorited: isFavorited)
    }
}
