//
//  GitmojiListView.swift
//  GitMoji
//
//  Created by Pakanon Pantisawat on 23/02/2021.
//

import SwiftUI

struct GitmojiListView: View {
    @State var searchFilter: String = ""
    var body: some View {
        VStack {
            Spacer()
            List(gitmojis, id: \.name) { gitmoji in
                GitmojiRowView(gitmoji: gitmoji)
                    .onTapGesture {
                        let pasteboard = NSPasteboard.general
                        pasteboard.clearContents()
                        pasteboard.setString(gitmoji.code, forType: .string)
                    }
            }
        }
    }
}

struct GitmojiListView_Previews: PreviewProvider {
    static var previews: some View {
        GitmojiListView(searchFilter: "")
    }
}
