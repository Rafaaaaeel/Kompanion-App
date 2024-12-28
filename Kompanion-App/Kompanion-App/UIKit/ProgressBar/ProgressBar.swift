import SwiftUI

struct KProgressBar : View {
    
    @State private var progress: Double = 0
    
    var targetProgress: Double
    var isHorizontal: Bool
    
    init(targetProgress: Double = 0, isHorizontal: Bool = false) {
        self.targetProgress = targetProgress
        self.isHorizontal = isHorizontal
    }
    
    var body: some View {
        if isHorizontal {
            ZStack {
                ArcShape(startAngle:.degrees(180), endAngle: .degrees(0))
                    .stroke(.gray, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: 360, height: 185)
                    
                ArcShape(startAngle: .degrees(180), endAngle: .degrees(180 + (progress * 18)))
                    .stroke(.orange, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: 360, height: 185)
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 0.2)) {
                    progress = targetProgress
                }
            }
        } else {
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: .infinity, height: 6)
                    .foregroundStyle(Color.gray)
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: 0, height: 6)
                    .foregroundStyle(Color.orange)
            }
            
        }
        
    }
    
    func setProgress(_ value: Double) -> KProgressBar {
        
        return .init(targetProgress: value, isHorizontal: self.isHorizontal)
    }
    
}

struct ArcShape: Shape {
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.midX, y: rect.maxY),
            radius: rect.width / 2,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: false
        )
        return path
    }
}


#Preview {
    KProgressBar()
        .setProgress(9)
}
