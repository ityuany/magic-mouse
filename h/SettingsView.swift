import SwiftUI

struct SettingsView: View {
    var body: some View {
        HStack(spacing: 20) {
            MonitorView()
            MonitorView()
        }
        .frame(width: 800, height: 600)
        .padding()
    }
}

struct MonitorView: View {
    var body: some View {
        VStack {
            // 显示器外框
            Rectangle()
                .fill(Color.gray)
                .frame(width: 300, height: 200)
                .overlay(
                    // 显示器屏幕
                    Rectangle()
                        .fill(Color.black)
                        .padding(10)
                )
            
            // 显示器底座
            Rectangle()
                .fill(Color.gray)
                .frame(width: 100, height: 20)
            
            Rectangle()
                .fill(Color.gray)
                .frame(width: 150, height: 10)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
