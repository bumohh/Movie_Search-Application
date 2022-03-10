import SwiftUI

struct CustomTextField: ViewModifier {
    var roundedCorners: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color
    @State var isFocused = false
    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(roundedCorners)
            .padding(3)
            .foregroundColor(textColor)
            .overlay(RoundedRectangle(cornerRadius: roundedCorners)
                        .stroke(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5))
            .font(.custom("Open Sans", size: 18))
            .shadow(radius: 10)
            .onSubmit {
                isFocused = false
            }
    }
}
