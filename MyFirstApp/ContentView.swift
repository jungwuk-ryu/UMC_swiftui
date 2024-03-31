//
//  ContentView.swift
//  MyFirstApp
//
//  Created by 유정욱 on 3/31/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(selection: .constant(1)) {
            HomeView().tabItem {
                VStack{
                    Image(systemName: "house")
                    Text("홈")
                }
            }.tag(1)
            HStack(){}.tabItem {
                VStack{
                    Image(systemName: "newspaper")
                    Text("동네생활")
                }
            }.tag(2)
            HomeView().tabItem {
                VStack{
                    Image(systemName: "mappin.and.ellipse.circle")
                    Text("내 근처")
                }
            }.tag(3)
            HomeView().tabItem {
                VStack{
                    Image(systemName: "bubble.left.and.bubble.right")
                    Text("채팅")
                }
            }.tag(4)
            HomeView().tabItem {
                VStack{
                    Image(systemName: "person")
                    Text("나의 당근")
                }
            }.tag(5)
            //Text("Tab Content 2").tabItem { Text("Tab Label 2") }.tag(2)
        }.accentColor(.gray)
    }
}

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Text("월계1동")
                        .fontWeight(.bold)
                    Image(systemName: "arrowtriangle.down")
                        .foregroundColor(.black)
                        .imageScale(.small)
                    Spacer()
                    Image(systemName: "magnifyingglass")
                    Image(systemName: "bell")
                        .foregroundColor(.black)
                    
                }
                .padding([.leading, .trailing], 20)
                ScrollView {
                    VStack(alignment: .leading) {
                        ItemView(name: "메이플 커피", desc: "달콤했습니다", img: "coffee", price: 0)
                        ItemView(name: "벚꽃", desc: "연대 앞 벚꽃길", img: "cherry_blossom", price: 2000000, yeah: true)
                        ItemView(name: "고기", desc: "배 터지는 줄 알았어요", img: "beef", price: 23000)
                        ItemView(name: "라면", desc: "김밥이랑 먹었습니당", img: "ramen", price: 0)
                        Color.white.opacity(0)
                        HStack() {
                            Text("돌고 도는 일상 🍪")
                                .font(.system(size: 22))
                                .fontWeight(.bold)
                            Spacer()
                            Image(systemName: "arrow.right")
                        }
                        .padding([.leading, .trailing], 20)
                        HorizontalPostList()
                        Spacer().frame(height: 20)
                        Divider()
                        Spacer().frame(height: 20)
                        ItemView(name: "신기했어요", desc: "그런데 좀 물리는 맛", img: "yummy", price: 2000)
                        ItemView(name: "메이플 커피", desc: "달콤했습니다", img: "coffee", price: 77777)
                        ItemView(name: "벚꽃", desc: "연대 앞 벚꽃길", img: "cherry_blossom", price: 0)
                        ItemView(name: "고기", desc: "배 터지는 줄 알았어요", img: "beef", price: 19222)
                        ItemView(name: "라면", desc: "김밥이랑 먹었습니당", img: "ramen", price: 8888)
                        ItemView(name: "신기했어요", desc: "그런데 좀 물리는 맛", img: "yummy", price: 0)
                    }
                }
                Spacer()
            
            }
            newPostButton()
                .offset(x: -20, y: -20)
                
        }
    }
}

struct newPostButton: View {
    var body: some View {
        HStack {
            Image(systemName: "plus")
                .foregroundStyle(.white)
            Text("글 쓰기").foregroundStyle(.white).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
        .padding(18)
        .background(Color(.sRGB, red: 255 / 255, green: 110 / 255, blue: 17 / 255))
        .cornerRadius(32.0)
        .shadow(radius: 8)
    }
}

struct HorizontalPostList : View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                HPLItem(name: "고기", img: "beef", price: 20000)
                HPLItem(name: "벚꽃", img: "cherry_blossom", price: 0)
                HPLItem(name: "라면", img: "ramen", price: 10900)
                HPLItem(name: "고기", img: "beef", price: 35600)
                HPLItem(name: "메이플 커피", img: "coffee", price: 4000)
                HPLItem(name: "고기", img: "beef", price: 20000)
                HPLItem(name: "고기", img: "beef", price: 20000)
            }
        }
        .padding([.bottom, .top], 10)
    }
}

struct HPLItem : View {
    let name: String
    let img: String
    let price: Int
    
    var body: some View {
        VStack (alignment: .leading){
            ItemImageView(img: img)
            Text("\(name)")
            Text("\(formatPrice(price: price))")
                .font(.system(size: 16))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
        .padding(.leading, 10)
    }
}

struct ItemView: View {
    let name: String
    let desc: String
    let img: String
    let price: Int
    var yeah: Bool = false
    
    var body: some View {
        VStack{
            HStack{
                ItemImageView(img: img)
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(name)")
                                .font(.system(size: 14))
                            Text("\(desc)")
                                .foregroundColor(.gray)
                                .font(.caption)
                                .padding([.top], 2)
                            HStack {
                                if yeah {
                                    Text("예약중")
                                        .font(.system(size: 13))
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .foregroundStyle(.white)
                                        .padding(5)
                                        .background(Color(red: 30 / 255, green: 158 / 255, blue: 115 / 255))
                                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                                }
                                Text(formatPrice(price: price))
                                    .font(.system(size: 18))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            }
                            Spacer()
                        }.padding([.top, .bottom], 2)
                        
                        Spacer()
                        
                        VStack{
                            Image(systemName: "ellipsis")
                                .foregroundColor(.gray)
                            Spacer()
                        }
                    }
                    HStack{
                        Spacer()
                        Image(systemName: "bubble.left.and.bubble.right")
                            .resizable()
                            .padding(.trailing, 0)
                            .foregroundColor(.gray)
                            .frame(width: 15, height: 14)
                        Text("7")
                            .foregroundColor(.gray)
                            .padding(.leading, 0)
                            .font(.system(size: 14))
                        Image(systemName: "heart")
                            .resizable()
                            .padding(.trailing, 0)
                            .foregroundColor(.gray)
                            .frame(width: 15, height: 14)
                        Text("7")
                            .foregroundColor(.gray)
                            .padding(.leading, 0)
                            .font(.system(size: 14))
                    }
                }
            }
            Spacer().frame(height: 10)
            Divider()
            Spacer().frame(height: 10)
        }.padding([.leading, .trailing])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        return ContentView();
    }
}

struct ItemImageView : View {
    let img : String
    
    var body: some View {
        Image(img)
            .resizable()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
            .cornerRadius(8.0)
            .aspectRatio(contentMode: .fit)
            .padding(.trailing, 10)
    }
}

func formatPrice(price: Int) -> String {
    var ret : String = ""

    if (price == 0) {
        ret = "나눔🧡"
        return ret
    }
    
    ret = "원"
    var cnt : Int = 0
    var pri : Int = price
    while (pri > 0) {
        ret = "\(pri % 10)" + ret
        pri /= 10
        
        cnt += 1
        if (cnt == 3) {
            cnt = 0;
            ret = "," + ret
        }
    }
    
    return ret
}
