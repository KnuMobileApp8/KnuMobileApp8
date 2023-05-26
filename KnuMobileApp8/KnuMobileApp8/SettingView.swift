import SwiftUI

struct SettingView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        let items = [
            SettingItem(icon: "pencil", title: "프로필 변경"),
            SettingItem(icon: "arrow.right.square", title: "로그아웃", action: { logout() }),
            SettingItem(icon: "person.crop.circle.badge.xmark", title: "회원 탈퇴"),
            SettingItem(icon: "heart", title: "찜 목록")
        ]

        return VStack {
            Text("설정").font(.largeTitle)
            NavigationView {
                List(items, id: \.title) { item in
                    if let icon = item.icon {
                        if let action = item.action {
                            Button(action: action) {
                                HStack {
                                    Image(systemName: icon)
                                        .foregroundColor(Color.black)
                                    Text(item.title)
                                        .foregroundColor(Color.black)
                                }
                            }
                        } else {
                            NavigationLink(destination: Text(item.title)) {
                                HStack {
                                    Image(systemName: icon)
                                        .foregroundColor(Color.black)

                                    Text(item.title)
                                        .foregroundColor(Color.black)

                                }
                            }
                        }
                    } else {
                        Text(item.title)
                    }
                }
                .navigationTitle("나의 정보").font(.subheadline)
            }
        }
    }

    func logout() {
        viewModel.logout()
        print("로그아웃")
    }

    struct SettingItem: Identifiable {
        let id = UUID()
        let icon: String?
        let title: String
        let action: (() -> Void)?

        init(icon: String?, title: String, action: (() -> Void)? = nil) {
            self.icon = icon
            self.title = title
            self.action = action
        }
    }

    struct SettingView_Previews: PreviewProvider {
        static var previews: some View {
            SettingView()
        }
    }
}
