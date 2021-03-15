//
//  ContentView.swift
//  swiftui-test
//
//  Created by vantuzproper on 10.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var vState = CGSize.zero
    @State var cShow=false
    @State var bState = CGSize.zero
    @State var ShowFull = false
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20:0)
                .opacity (cShow ? 0.4:1)
                .offset(y:cShow ? -200:0)
                .animation(Animation.default.delay(0.1))
            BackCardView()
                .frame(width: cShow ? 300: 340, height:220)
                .background(show ? Color(#colorLiteral(red: 0, green: 0.8879132867, blue: 0, alpha: 1)): Color(#colorLiteral(red: 0.7039064765, green: 0, blue: 0.6665282249, alpha: 1)))
                .cornerRadius(20)
                .shadow(radius:20)
                .offset(x:0,y: show ? -400:-70)
                .offset(x:vState.width, y:vState.height)
                .offset(y:cShow ? -180 : 0)
                .scaleEffect(cShow ? 1 : 0.8)
                .rotationEffect(.degrees(show ? 0:10))
                .rotationEffect(.degrees(cShow ? -10:0))
                .rotation3DEffect(.degrees(show ? 0:10), axis: (x:show ? 0:10, y:0, z:0))
                .rotation3DEffect(.degrees(cShow ? -10:0), axis: (x:10, y:0, z:0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            BackCardView()
                .frame(width:340, height:220)
                .background(show ? Color(#colorLiteral(red: 0.7039064765, green: 0, blue: 0.6665282249, alpha: 1)): Color(#colorLiteral(red: 0, green: 0.8879132867, blue: 0, alpha: 1)))
                .cornerRadius(20)
                .shadow(radius:20)
                .offset(x:0,y: show ? -200:-30)
                .offset(x:vState.width, y:vState.height)
                .offset(y:cShow ? -140 : 0)
                .scaleEffect(cShow ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotation3DEffect(.degrees(show ? 0:5), axis: (x:show ? 0:5, y:0, z:0))
                .rotation3DEffect(.degrees(cShow ? -5:0), axis: (x:5, y:0, z:0))
                .rotationEffect(.degrees(cShow ? -5:0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            CardView()
                .frame(width: cShow ? 370 : 340, height:220)
                .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                //.cornerRadius(20.0)
                .clipShape(RoundedRectangle(cornerRadius: cShow ? 30 : 20, style: .continuous))
                .shadow(radius: 20)
                .offset(x:vState.width, y:vState.height)
                .offset(y:cShow ? -100 : 0)
                .blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.cShow.toggle()
                }
                .gesture(DragGesture().onChanged { value in self .vState=value.translation
                            self.show=true}
                            .onEnded {value in self.vState = .zero
                                self.show=false
                            })
            BottomCardView(show: $cShow)
                .offset(x: 0, y:cShow ? 500:1000)
                .offset(y:bState.height)
                .blur(radius: show ? 20:0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
                .gesture(DragGesture().onChanged {
                    value in self.bState = value.translation
                    if self.ShowFull {
                        self.bState.height -= 300
                    }
                    if self.bState.height < -300 {
                        self.bState.height = -300
                    }
                }
                .onEnded {value in
                    if self.bState.height > 100 {
                        self.cShow = false
                    }
                    else if (self.bState.height < -200 && !self.ShowFull) || (self.bState.height < 250 && self.ShowFull) {
                        self.bState.height = -400
                        self.ShowFull = true
                    }
                    else {
                      self.bState = .zero
                      self.ShowFull = false
                    }
                })
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
                        .foregroundColor(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1))) //я просто хочу желтый текст)))
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
        
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        
        
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

struct BottomCardView: View {
    @Binding var show: Bool
    var body: some View {
        VStack(spacing:15) {
            Rectangle()
                .frame(width:40, height:5)
                .cornerRadius(3)
                .opacity(0.3)
            Text("Адаптивный дизайн SwiftUI от человека, не знающего ничего про дизайн. Но зато цвета вырвиглазные!")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            HStack(spacing:20) {
                RingView(color1: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), width: 88, height: 88, percent: 78, show: $show)
                    .animation(Animation.easeInOut.delay(0.4))
                VStack (alignment:.leading, spacing: 8){
                    Text("Дизайн в SwiftUI")
                        .bold()
                    Text("39/50 уроков завершено")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 10)
            }
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color("Background 3"))
        .cornerRadius(30)
        .shadow(radius: 20)
        
    }
}
