//
//  NewsModel.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 11.05.2022.
//

// MARK: - Welcome
struct NewsContainer: Codable {
    let response: NewsResponse
}

// MARK: - Response
struct NewsResponse: Codable {
    let items: [ResponseItem] // содержание поста текст фото
    let groups: [NewsGroup] // аватарка и назвние группы
    let nextFrom: String

    enum CodingKeys: String, CodingKey {
        case items, groups
        case nextFrom = "next_from"
    }
}

// MARK: - Group
struct NewsGroup: Codable {
    let id: Int
    let photo50: String
    let screenName: String

    enum CodingKeys: String, CodingKey {
        case id
        case photo50 = "photo_50"
        case screenName = "screen_name"
    }
}

// MARK: - ResponseItem
struct ResponseItem: Codable {
    let date: Int
    let text: String?
    //let photos: Photos?
   

    enum CodingKeys: String, CodingKey {
        case date
        case text
        //case photos
        
    }
}

struct News: Identifiable {
    var id: Double
    var userImage: String
    var userName: String
    var newsDate: String
    var newsText: String
    var newsImage: String
}

var news = [
    News(id: 1, userImage: "donald", userName: "Donald Trump", newsDate: "21.04.2020г.", newsText: "Цена нефти марки WTI с поставкой в мае упала ниже одного доллара — впервые в истории. Об этом свидетельствуют данные торгов на бирже ICE в Лондоне. В моменте американская смесь стоила 16 центов, а потом стоимость опустилась до нуля. К 21:23 WTI торговалась в отрицательных значениях — минус 7,5 доллара, а после и вовсе — почти до минус 40 долларов (37,6 доллара за баррель).", newsImage: "wti"),
    
    News(id: 2, userImage: "rayDalio", userName: "Ray Dalio", newsDate: "23.11.2019г.", newsText: "Крупнейший хедж-фонд мира Bridgewater Associates, основанный миллиардером Реем Далио, сделал крупную ставку на падение фондовых рынков США и Европы к марту 2020 года, утверждает газета The Wall Street Journal. По словам источников издания, хедж-фонд, под управлением которого находится $150 млрд от 350 клиентов, вложил около $1,5 млрд покупку пут-опционов на американский фондовый индекс S&P 500 и европейский Euro Stoxx 50. Господин Далио заявил, что представленные газетой данные не соответствуют действительности.", newsImage: "dollars")

]

