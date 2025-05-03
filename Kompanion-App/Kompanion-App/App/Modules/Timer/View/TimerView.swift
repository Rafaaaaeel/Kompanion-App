import SwiftUI

//struct TimerView : View {
//    var body: some View {
//
//
//        .padding()
//        .toolbar(.hidden, for: .tabBar)
//    }
//}

struct TimerView : View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
    @State private var counter = 0
    @State private var progress: CGFloat = 120
    
    var body: some View {
        ZStack {
            VStack {
                
                
                Spacer()
                Rectangle()
                    .frame(width: .infinity, height: progress)
                    .foregroundStyle(.blue)
                    .onTapGesture {
                        progress += 90
                    }
                    
            }.ignoresSafeArea()
            
            VStack(spacing: 8){
                KTitle()
                    .text("Math")
                    .font(.h4)
                    .rounded(true)
                KTitle()
                    .text("5:00")
                    .font(.h1)
                    .rounded(true)
                KButton()
                    .image(systemName: "pause.fill")
                    .label("Pause")
                
            }.padding()

        }
        .animation(.smooth, value: progress)
        .onReceive(timer) { time in
            if counter == 25 {
                timer.upstream.connect().cancel()
            } else {
                print("The time is now \(time)")
                progress += 15
            }
            
            counter += 1
        }
    }
}


#Preview {
    TimerView()
}
