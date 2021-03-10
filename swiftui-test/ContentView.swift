//
//  ContentView.swift
//  swiftui-test
//
//  Created by vantuzproper on 10.03.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TitleView()
            BackCardView()
                .background(Color(#colorLiteral(red: 0, green: 0.8879132867, blue: 0, alpha: 1)))
                .cornerRadius(20)
                .offset(x:0,y:-60)
                .scaleEffect(0.8)
                .rotationEffect(.degrees(10))
                .rotation3DEffect(.degrees(10), axis: (x:10, y:0, z:0))
                .blendMode(.hardLight)
            BackCardView()
                .background(Color(#colorLiteral(red: 0.7039064765, green: 0, blue: 0.6665282249, alpha: 1)))
                .cornerRadius(20)
                .offset(x:0,y:-30)
                .scaleEffect(0.9)
                .rotationEffect(.degrees(5)).rotation3DEffect(.degrees(5), axis: (x:5, y:0, z:0))
                .blendMode(.hardLight)
            CardView()
            VStack {
                Text("Адаптивный дизайн SwiftUI от человека, не знающего ничего про дизайн. Но зато цвета вырвиглазные!")
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .lineSpacing(4)
                Spacer()
            }
            .padding(.top, 8)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
            .background(Color("Background 3"))
            .cornerRadius(30)
            .shadow(radius: 20)
            .offset(x: 0, y:500)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro")
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .leading){
                    Text("Дизайн в SwiftUI")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.yellow) //я просто хочу желтый текст)))
                    Text("Сертификат")
                        .foregroundColor(Color("Primary"))
                }
                Spacer()
                Image("Logo SwiftUI")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
            }
            .padding(.horizontal, 25)
            .padding(.top, 25)
            Image("2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 110, alignment: .top)
        }
        .frame(width: 340, height:220)
        .background(Color.black)
        .cornerRadius(20.0)
        .shadow(radius: 20)
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width:340, height:220)
        
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text ("Сертификаты")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .padding()
            Spacer()
        }
    }
}
