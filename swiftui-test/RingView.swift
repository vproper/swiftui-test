//
//  RingView.swift
//  swiftui-test
//
//  Created by vantuzproper on 13.03.2021.
//

import SwiftUI

struct RingView: View {
    var color1 = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    var color2 = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
    var width:CGFloat = 44.0
    var height:CGFloat = 44.0
    var percent:CGFloat=78.0
    @Binding var show:Bool
    var body: some View {
        let multiplier = width/44
        let progress:CGFloat = 1 - percent / 100
        ZStack {
            Circle().stroke(Color.black.opacity(0.1),style: StrokeStyle(lineWidth: 5*multiplier,lineJoin: .round))
                .frame(width:width, height:height)
            Circle()
                .trim(from:show ? progress : 1, to: 1)
                .stroke(LinearGradient(gradient: Gradient(colors: [Color(color1), Color(color2)]), startPoint: .topTrailing, endPoint: .bottomLeading), style: StrokeStyle(lineWidth: 5*multiplier,lineJoin: .round))
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(
                    Angle(degrees: 180),
                    axis: (x: 1.0, y: 0.0, z: 0.0))
                .frame(width: width, height: height)
                .shadow(color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)).opacity(0.1), radius: 3 * multiplier, x: 0, y: 3)
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
