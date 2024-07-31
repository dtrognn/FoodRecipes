//
//  MainTabView.swift
//  FoodRecipes
//
//  Created by dtrognn on 31/7/24.
//

import FRCommon
import SwiftUI

struct MainTabView: View {
    @StateObject private var router = TabbarRouter()

    var body: some View {
        TabView(selection: $router.selectedTab) {
            HomeRouterView()
                .tabItem {
                    TabItem(tabType: .home)
                }.tag(TabbarRouter.TabType.home)

            ProfileRouterView()
                .tabItem {
                    TabItem(tabType: .profile)
                }.tag(TabbarRouter.TabType.profile)
        }.tint(Color.red)
    }
}

private class TabbarRouter: ObservableObject {
    enum TabType: Hashable {
        case home
        case profile

        func tabItemData() -> TabItemData {
            switch self {
            case .home:
                return TabItemData(title: language("Tabbar_A_01"), normalImage: Image("ic_tabbar_home_2", bundle: .main), slectedImage: Image("ic_tabbar_home"))
            case .profile:
                return TabItemData(title: language("Tabbar_A_02"), normalImage: Image("ic_tabbar_profile"), slectedImage: Image("ic_tabbar_profile"))
            }
        }
    }

    @Published var selectedTab: TabType = .home
}

private struct TabItem: View {
    let tabType: TabbarRouter.TabType
    private let tabItemData: TabItemData
    @State var languageIdentifier = LanguageManager.shared.currentLanguage.getLanguageCode()

    init(tabType: TabbarRouter.TabType) {
        self.tabType = tabType
        self.tabItemData = tabType.tabItemData()
    }

    let colorSelection = Color.red

    var body: some View {
        Label {
            Text(tabItemData.title)
                .foregroundColor(colorSelection)
        } icon: {
            tabItemData.normalImage
                .applyTheme()
        }.environment(\.locale, .init(identifier: languageIdentifier))
            .onReceive(LanguageManager.shared.onChangeLanguageBundle) { languageCode in
                languageIdentifier = languageCode.getLanguageCode()
            }
    }
}

private struct TabItemData {
    var title: LocalizedStringKey
    var normalImage: Image
    var slectedImage: Image
}