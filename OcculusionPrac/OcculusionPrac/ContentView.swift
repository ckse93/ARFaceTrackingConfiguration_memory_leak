//
//  ContentView.swift
//  OcculusionPrac
//
//  Created by Chan.Jung on 10/28/22.
//

import ARKit
import SwiftUI
import RealityKit
import Combine

struct ContentView : View {
    
    @State private var showARView: Bool = false
    
    var body: some View {
        Button {
            self.showARView.toggle()
        } label: {
            Text("present arView")
        }
        .fullScreenCover(isPresented: $showARView) {
            ZStack {
                ARViewContainer().ignoresSafeArea(.all)
                
                Button {
                    self.showARView.toggle()
                } label: {
                    Text("dismiss arvew")
                }
                .padding()
                .background(Color.orange)
                .cornerRadius(5)
            }
        }
    }
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let faceConfiguration = ARFaceTrackingConfiguration()
        arView.session.run(faceConfiguration)
        
        context.coordinator.arView = arView
        context.coordinator.setup()
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
}

class Coordinator {
    weak var arView: ARView?
    
    func setup() {  // create occlulusion material
        guard let arView = self.arView else { return }
        
        let faceAnchor = try! FaceExperience.loadFacePan()
        
        arView.scene.addAnchor(faceAnchor)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
