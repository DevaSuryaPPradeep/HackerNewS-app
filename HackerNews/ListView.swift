//
//  ListView.swift
//  HackerNews
//
//  Created by Devasurya on 05/03/24.
//

import SwiftUI

struct ListView: View {
    /// Variable declarations
    @ObservedObject  var APIManager = NetworkManger()
    @State var screenTransitionVariable: Bool = false
    var body: some View {
        NavigationStack{
            VStack {
                List(APIManager.postdata) {post in
                        NavigationLink(value: post.url) {
                            HStack{
                                Text("\(post.points)")
                                Spacer()
                                Text(post.title)
                                    .font(.headline)
                                Spacer()
                            }
                            .navigationDestination(for: String.self) { value in
                                DetailView(url: value)
                            }
                        }
                    }
                    .listStyle(.insetGrouped)
                }
                .onAppear{
                    APIManager.fetchData()
                }
                .navigationTitle("HackerNews")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }


#Preview {
    ListView()
}
