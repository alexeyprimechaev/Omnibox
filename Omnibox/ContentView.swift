import SwiftUI

struct ContentView: View {
    
    
    @MainActor func saveImage() {
        let renderer = ImageRenderer(content: image.preferredColorScheme(.dark))
        renderer.scale = 10
        renderer.isOpaque = false
        renderer.colorMode = .nonLinear
        
        
        if let image = renderer.uiImage {
            if let data = image.pngData(), let pngImage = UIImage(data: data) {
                        UIImageWriteToSavedPhotosAlbum(pngImage, nil, nil, nil)
                    }
        }
    }
    
    var body: some View {
        ZStack {
            
            VStack {
                Button("Save") {
                    saveImage()
                }
                
                image
            }
            
            
        }
    }
    
    
    
    var image: some View {
        
        HStack {
            HStack(spacing: 5) {
                Text("developer.apple.com").foregroundStyle(.primary)
                Image(systemName: "lock.fill").imageScale(.small).foregroundStyle(.secondary)
            }
            Spacer()
            
            
            HStack(spacing: 17) {
                Image(systemName: "ellipsis.circle")
                Image(systemName: "square.on.square")
            }.foregroundColor(.accentColor).imageScale(.large).offset(x: 1)
        }.padding().padding(.vertical, -1).background(RoundedRectangle(cornerRadius: 20, style: .continuous).foregroundStyle(.bar)).padding().padding(.horizontal, 4).frame(width: 390, height: 390).background(LinearGradient(gradient: Gradient(colors: [.green, .teal, .cyan]), startPoint: .topLeading, endPoint: .bottomTrailing))
        
    }
}
