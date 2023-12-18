//
//  ContentView.swift
//  SettingApp
//
//  Created by 윤영진 on 11/30/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAirplaneModeOn: Bool = false
    @State private var isVPNModeOn: Bool = false
    
    var body: some View {
        NavigationView {
            
            List {
                
                Section {
                    
                    NavigationLink {
                        //UserPageView()
                    } label: {
                        profileCell()
                    }
                    
                }
                
                Section {
                    
                    ToggleCell("airplane", .orange, "에어플레인 모드", $isAirplaneModeOn)

                    LabelNavWithSystemName("wifi", .blue, "Wi-Fi", "netis 2G") {
                        Text("Wi-Fi화면")
                    }
                    LabelNavWithSystemName("bolt.fill", .blue, "Blutooth", "켬") {
                        Text("블루투스 화면")
                    }
                    LabelNavWithSystemName("antenna.radiowaves.left.and.right", .green, "셀룰러") {
                        Text("셀룰러 화면")
                    }
                    LabelNavWithSystemName("personalhotspot", .green, "개인용 핫스팟") {
                        Text("개인용 핫스팟 화면")
                    }
                    
                    ToggleCell("lock.shield.fill", .indigo, "VPN", $isVPNModeOn)
                    
                }
                
                Section {
                    
                    LabelNavWithSystemName("bell.badge.fill", .orange, "알림") {
                        Text("알림 화면")
                    }
                    LabelNavWithSystemName("speaker.wave.3.fill", .pink, "사운드 및 햅틱") {
                        Text("사운드 및 햅틱 화면")
                    }
                    LabelNavWithSystemName("moon.fill", .indigo, "집중 모드") {
                        Text("집중 모드 화면")
                    }
                    LabelNavWithSystemName("hourglass", .indigo, "스크린 타임") {
                        Text("스크린 타임 화면")
                    }
                    
                }
                
                Section {
                    
                    LabelNavWithSystemName("gear", .gray, "일반") {
                        Text("일반 화면")
                    }
                    LabelNavWithSystemName("switch.2", .gray, "제어 센터") {
                        Text("제어 센터 화면")
                    }
                    LabelNavWithSystemName("button.vertical.left.press.fill", .blue, "동작 버튼") {
                        Text("동작 버튼 화면")
                    }
                    LabelNavWithSystemName("sun.max.fill", .blue, "디스플레이 및 밝기") {
                        Text("디스플레이 및 밝기 화면")
                    }
                    
                }
                
            }
            .navigationTitle(Text("설정"))
        }
    }
    
    @ViewBuilder
    private func profileCell() -> some View {
        HStack {
            Image(systemName: "airplane")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .padding(.all, 10)
                .background(.green)
                .foregroundColor(.white)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 3) {
                Text("youngjin yoon")
                    .font(.system(size: 24))
                    .fontWeight(.regular)
                Text("Apple ID, iCloud, 미디어 및 구입")
                    .font(.system(size: 14))
            }
            .padding(.leading, 6)
        }
        .padding(.vertical, 10)
    }
    
    @ViewBuilder
    private func iconImage(imageName: String, iconColor: Color) -> some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 20, height: 20)
            .padding(.all, 4)
            .background(iconColor)
            .foregroundColor(.white)
            .cornerRadius(6)
    }
    
    @ViewBuilder
    private func ToggleCell(_ systemName: String, _ backgroundColor: Color, _ cellTitle: String,
                            _ isModeOn: Binding<Bool>) -> some View {
        HStack{
            iconImage(imageName: systemName, iconColor: backgroundColor)
            
            Toggle(cellTitle, isOn: isModeOn)
        }
    }
    
    @ViewBuilder
    private func LabelNavWithSystemName<V: View>(_ systemName: String, _ backgroundColor: Color,
                                                 _ cellTitle: String, _ subTitle: String? = nil,
                                                 _ destination: @escaping () -> V) -> some View {
        HStack{
            iconImage(imageName: systemName, iconColor: backgroundColor)
            
            NavigationLink {
                destination()
            } label: {
                HStack {
                    Text(cellTitle)
                    Spacer()
                    if let optionalTitle = subTitle {
                        Text(optionalTitle).foregroundStyle(.gray)
                    }
                }
            }
        }
        
    }
    
}

#Preview {
    ContentView()
}
