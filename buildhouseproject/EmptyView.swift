//
//  EmptyView.swift
//  buildhouseproject
//
//  Created by pooh on 27/11/2565 BE.
//

import SwiftUI

struct EmptyView: View {
    
    @Binding var query: String
    
    var body: some View {
        Text("We couldn't find: \(query)")
    }
}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView(query: .constant("test"))
    }
}
