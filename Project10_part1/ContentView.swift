//
//  ContentView.swift
//  Project10_part1
//
//  Created by K.Takahama on R 4/12/13.
//

import SwiftUI

class User: ObservableObject, Codable {
    //どのプロパティを保存するのかをCodingKeyを使用していく
    enum CodingKeys: CodingKey {
        case name
    }
    //published プロパティを追加するとエラーになる
    @Published var name = "Kenichi Takahama"
    
    //読み取る方法decod
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    //書き込む方法 encode
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
    //Codableを再度復習してみようと思う！今回はここまで！
}

struct ContentView: View {
    //Project10_part1 やっていきやしょう(๑>◡<๑)！！
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
