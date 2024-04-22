//
//  FavoritesView.swift
//  Headspacey
//
//  Created by Shriya on 4/17/24.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .padding()
                        .background(backgroundBlue)
                        .clipShape(Circle())
                }
                Spacer()
                Text("Favorites")
                    .font(.title2)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "chevron.left")
                    .foregroundColor(backgroundBlue)
                    .padding()
                    .background(backgroundBlue)
                    .clipShape(Circle())
            }
            .padding(.top, 70)
            HStack {
                Text("Find all your favorite meditations and exercises here.")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: 80)
            .background(lighterBlue)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(backgroundBlue)
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    FavoritesView()
}
