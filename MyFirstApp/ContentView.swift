//
//  ContentView.swift
//  MyFirstApp
//
//  Created by 유정욱 on 3/31/24.
//

import SwiftUI

class PriceModel: ObservableObject {
    @Published var price: Int = 20000
}

struct ContentView: View {
    @StateObject var priceModel = PriceModel();
    
    var body: some View {
        NavigationView {
            VStack{
                ZStack(alignment: .topLeading) {
                    ScrollView {
                        VStack {
                            TopImage()
                            Content(priceModel: priceModel)
                        } .padding(.horizontal)
                    }
                    TopBar()
                }
                BottomBar(priceModel: priceModel)
            }
        }
    }
}

struct TopBar: View {
    var body: some View {
        HStack{
            Image(systemName: "arrow.left")
                .foregroundColor(.white)
            Spacer()
            HStack(spacing: 10) {
                Image(systemName: "house")
                    .foregroundColor(.white)
                Image(systemName: "square.and.arrow.up")
                    .foregroundColor(.white)
                Image(systemName: "cart")
                    .foregroundColor(.white)
            }
        }
        .padding(20)
        .background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.3), Color.gray.opacity(0)]), startPoint: .top, endPoint: .bottom))
    }
}

struct BottomBar: View {
    @ObservedObject var priceModel: PriceModel
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("배달최소주문금액")
                        .font(.system(size: 15))
                        .foregroundStyle(.gray)
                    Text("17,000원")
                }
                ZStack {
                    Color(.sRGB, red: 94/255, green: 190/255,  blue: 187/255)
                        .frame(width: .infinity)
                        .cornerRadius(12)
                    NavigationLink {
                        SecondView(priceModel: priceModel)
                    } label: {
                        Text("\(priceModel.price)원 담기")
                            .foregroundStyle(.white)
                    }
                }
            }
            .padding(20)
        }.frame(height: 100)
    }
}

struct TopImage : View {
    var body: some View {
        Image("beef")
            .resizable()
            .frame(width: .infinity, height: 300)
    }
}

struct Content : View {
    @ObservedObject var priceModel: PriceModel
    
    var body: some View {
        VStack {
            ContentTop()
            CustomDivider()
            Price(priceModel: priceModel)
        }
    }
}

struct ContentTop : View {
    var body: some View {
        VStack(alignment: .leading) {
            Text ("[재주문1위] 삼겹살")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Text("바싹 익힌 삼겹살의 풍미를 입안 가득 느낄 수 있어요")
                .foregroundStyle(.gray)
            

            Text("영양성분 및 알레르기 성분 표시 보기")
                .font(.system(size: 11))
                .fontWeight(.light)
                .padding(5)
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
        }
    }
}

struct Price : View {
    @ObservedObject var priceModel: PriceModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("가격")
                .font(.system(size: 20))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            HStack {
                Button(action: {
                    priceModel.price = 20000
                }, label: {
                    if (priceModel.price == 20000) {
                        Image(systemName: "checkmark.rectangle.fill")
                    } else {
                        Image(systemName: "checkmark.rectangle")
                            .foregroundColor(.gray)
                    }
                })
                Text("M")
                Spacer()
                Text("20,000원")
            }
            HStack {
                Button(action: {
                    priceModel.price = 30000
                }, label: {
                    if (priceModel.price == 30000) {
                        Image(systemName: "checkmark.rectangle.fill")
                    } else {
                        Image(systemName: "checkmark.rectangle")
                            .foregroundColor(.gray)
                    }
                })
                Text("L")
                Spacer()
                Text("30,000원")
            }
        }
    }
}

struct CustomDivider : View {
    var body: some View {
        Color.gray.opacity(0.2)
            .frame(width: .infinity, height: 10)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        return ContentView();
    }
}


struct SecondView: View {
    @ObservedObject var priceModel: PriceModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
                Spacer()
                Text("장바구니")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            Spacer().frame(height: 20)
            HStack {
                Text("배달/포장")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Text("배민스토어")
                    .foregroundStyle(.gray)
                Spacer()
                Text("대용량특가")
                    .foregroundStyle(.gray)
                Spacer()
                Text("전국별미")
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal)
            Divider()
            HStack {
                Text("배달")
                    .font(.system(size: 20))
                    .bold()
                Text("로 받을게요")
            }
            .padding()
            CustomDivider()
            
            ScrollView {
                VStack {
                    HStack {
                        Text("정욱이네 삼겹살")
                            .bold()
                            .font(.system(size: 18))
                        Spacer()
                        Image(systemName: "clock")
                        Text("20~30분 후 도착")
                    }
                    .padding()
                    Divider()
                    HStack {
                        Text("[재주문1위] 삼겹살")
                        Spacer()
                        Image(systemName: "xmark")
                    }.padding()
                    HStack {
                        Image("beef")
                            .resizable()
                            .frame(width: 80, height: 90)
                            .cornerRadius(10)
                        VStack(alignment:.leading) {
                            Text("가격: \(priceModel.price)원")
                                .foregroundStyle(.gray)
                                .font(.system(size: 15))
                                .fontWeight(.ultraLight)
                            Text("\(priceModel.price)원")
                                .font(.system(size: 20))
                                .fontWeight(.light)
                        }.padding()
                    }.padding()
                        .bold()
                        .font(.system(size: 18))
                    HStack() {
                        Spacer()
                        Text("옵션변경")
                            .padding()
                            .border(.gray.opacity(0.3), width: 1)
                                        
                    }
                    .padding()
                    Spacer()
                }
            }
            Divider()
            HStack {
                Text("2")
                    .padding( 10)
                    .background(.white)
                    .cornerRadius(30)
                Spacer()
                Text("배달 주문하기!")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                Spacer()
                Text("\(priceModel.price)원")
                    .foregroundStyle(.white)
                    .bold()
            }.padding(.horizontal, 30)
                .padding(.vertical, 10)
                .background(Color(.sRGB, red: 94/255, green: 190/255,  blue: 187/255))
                .cornerRadius(10)
                .padding(10)
                
        }
    }
}

//Color(.sRGB, red: 94/255, green: 190/255,  blue: 187/255)
