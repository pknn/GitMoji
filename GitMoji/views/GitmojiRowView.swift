//
//  GitmojiRowView.swift
//  GitMoji
//
//  Created by Pakanon Pantisawat on 23/02/2021.
//

import SwiftUI

struct GitmojiRowView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var gitmoji: GitMoji
    @State private var hover = false
    var body: some View {
        HStack {
            Text(gitmoji.emoji)
                .font(.title)
            Text(gitmoji.description)
                .font(.headline)
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(self.hover ? 0.4 : 0))
        .cornerRadius(10)
        .onHover { _ in self.hover.toggle() }
    }
}

@available(OSX 11.0, *)
struct GitmojiRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GitmojiRowView(gitmoji: gitmojis[0])
                .preferredColorScheme(.dark)
            GitmojiRowView(gitmoji: gitmojis[1])
                .preferredColorScheme(.light)
        }.previewLayout(.fixed(width: 400, height: 400))
    }
}
