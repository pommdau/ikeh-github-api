//
//  SearchSuggestionStoreProtocol.swift
//  IKEHGitHubAPIDemo
//
//  Created by HIROKI IKEUCHI on 2025/04/02.
//

import SwiftUI

@MainActor
protocol SearchSuggestionStoreProtocol: AnyObject {
    static var shared: Self { get } // シングルトン
    var historySuggestions: [String] { get set } // 検索履歴
}

extension SearchSuggestionStoreProtocol {
    
    // MARK: - Property
    
    /// 履歴の最大記憶数
    var maxHistoryCount: Int {
        5
    }
    
    /// アプリ側で固定のレコメンド
    var recommendedSuggestions: [String] {
        ["SwiftUI", "Swift", "Python", "Apple", "Qiita"]
    }
    
    // MARK: - CRUD
    
    func addHistory(_ keyword: String) {
        if keyword.isEmpty {
            return
        }
        // 履歴にある場合は最新になるように再配置
        if let index = historySuggestions.firstIndex(where: { $0 == keyword }) {
            historySuggestions.remove(at: index)
            historySuggestions.insert(keyword, at: 0)
            return
        }
        
        // 履歴になければ検索された語句を追加
        historySuggestions.insert(keyword, at: 0)
        
        // 履歴の上限を超えた分を古い順に削除
        while historySuggestions.count > maxHistoryCount {
            historySuggestions.removeLast()
        }
    }
    
    func removeHistory(atOffsets offSets: IndexSet) {
        historySuggestions.remove(atOffsets: offSets)
    }
        
    func removeAllHistories() {
        historySuggestions.removeAll()
    }
}
