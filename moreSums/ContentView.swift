import SwiftUI
import CoreGraphics

struct Plot {
    let x: (CGFloat) -> CGFloat
    let y: (CGFloat) -> CGFloat
    let plot = Plot(x: { x in x }, y: { y in y * y })
    let image = plot.plot(size: CGSize(width: 100, height: 100))

    func plot(size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        let img = renderer.image { ctx in
            let path = UIBezierPath()
            path.move(to: CGPoint(x: x(0), y: y(0)))

            for i in 0...Int(size.width) {
                let xValue = x(CGFloat(i))
                let yValue = y(CGFloat(i))
                path.addLine(to: CGPoint(x: xValue, y: yValue))
            }

            UIColor.black.setStroke()
            path.stroke()
        }
        return img
    }
}

struct ContentView: View {
    @State private var n: String = ""
    @State private var result: Double = 0.0
    
    var body: some View {
        VStack {
            Text("Harmonic Series Calculator")
                .font(.title)
            TextField("Enter a value for N", text: $n)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(decimalPad)
            Button(action: {
                if let n = Int(self.n) {
                    self.result = sUp(N: n)
                    self.result = sDown(n: n)
                }
            }) {
                Text("Calculate")
            }
            Text("Result: \(result, specifier: "%.2f")")
                .padding(.top, 20)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
