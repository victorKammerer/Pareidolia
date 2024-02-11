//
//  DrawView.swift
//  Pareidolia
//
//  Created by Victor Kammerer on 10/02/24.
//

import SwiftUI

struct Line {
    var points: [CGPoint]
    var color: Color
    var lineWidth: Double
}

struct DrawView: View {
    
    @State private var lines = [Line]()
    @State private var deletedLines = [Line]()
    
    @State private var selectedLineWidth: CGFloat = 1
    
    let engine = DrawEngine()
    
    var body: some View {
        
        ZStack {
            BackgroundView(imageName: "bg_menu")
                .blur(radius: 10)
            VStack {
                DrawArea
                HUDBar
                    .padding(.bottom, 40)
                    .background()
            }
        }
    }
}

#Preview {
    DrawView()
}


extension DrawView {
    
    var DrawArea: some View {
        Canvas { context, size in
            
            for line in lines {
                
                let path = engine.createPath(for: line.points)
                
                context.stroke(path, with: .color(line.color), style: StrokeStyle(lineWidth: line.lineWidth, lineCap: .round, lineJoin: .round))
            }
            
        }.frame(width: 400, height: 750)
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged({ value in
                let newPoint = value.location
                if value.translation.width + value.translation.height == 0 {
                    lines.append(Line(points: [newPoint], color: .black, lineWidth: selectedLineWidth))
                } else {
                    let index = lines.count - 1
                    lines[index].points.append(newPoint)
                }
            }).onEnded({ value in
                if let last = lines.last?.points, last.isEmpty {
                    lines.removeLast()
                }
                
            })
        )
    }
    var HUDBar: some View {
        HStack {
            
            Button {
                let last = lines.removeLast()
                deletedLines.append(last)
            } label: {
                Image(systemName: "arrow.uturn.backward.circle")
                    .imageScale(.large)
            }.disabled(lines.count == 0)
            
            Button {
                let last = deletedLines.removeLast()
                lines.append(last)
            } label: {
                Image(systemName: "arrow.uturn.forward.circle")
                    .imageScale(.large)
            }.disabled(deletedLines.count == 0)
            
            Slider(value: $selectedLineWidth, in: 2...10) {
                Text("linewidth")
            }.frame(maxWidth: 100)
            Text(String(format: "%.0f", selectedLineWidth))
            
            Spacer()
            
            Button{
                
            } label: {
                Text("Finalizar")
                    .background(Color.red)
            }
        }.padding()
    }
}
