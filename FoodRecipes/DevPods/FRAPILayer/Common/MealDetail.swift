//
//  MealDetail.swift
//  FRAPILayer
//
//  Created by dtrognn on 1/8/24.
//

import Foundation

public struct MealDetail: Codable, Identifiable {
    public let id: String
    public let name: String
    public let drinkAlternate: String?
    public let category: String
    public let area: String
    public let instructions: String
    public let mealThumb: String
    public let tags: String?
    public let youtube: String
    public let ingredients: [String?]
    public let measures: [String?]
    public let source: String?
    public let imageSource: String?
    public let creativeCommonsConfirmed: String?
    public let dateModified: String?

    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case drinkAlternate = "strDrinkAlternate"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case mealThumb = "strMealThumb"
        case tags = "strTags"
        case youtube = "strYoutube"
        case ingredients = "strIngredients"
        case measures = "strMeasures"
        case source = "strSource"
        case imageSource = "strImageSource"
        case creativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified
    }

    enum AdditionalKeys: String, CodingKey {
        case strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5
        case strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10
        case strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15
        case strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        case strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5
        case strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10
        case strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15
        case strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        drinkAlternate = try container.decodeIfPresent(String.self, forKey: .drinkAlternate)
        category = try container.decode(String.self, forKey: .category)
        area = try container.decode(String.self, forKey: .area)
        instructions = try container.decode(String.self, forKey: .instructions)
        mealThumb = try container.decode(String.self, forKey: .mealThumb)
        tags = try container.decodeIfPresent(String.self, forKey: .tags)
        youtube = try container.decode(String.self, forKey: .youtube)
        source = try container.decodeIfPresent(String.self, forKey: .source)
        imageSource = try container.decodeIfPresent(String.self, forKey: .imageSource)
        creativeCommonsConfirmed = try container.decodeIfPresent(String.self, forKey: .creativeCommonsConfirmed)
        dateModified = try container.decodeIfPresent(String.self, forKey: .dateModified)

        let additionalContainer = try decoder.container(keyedBy: AdditionalKeys.self)
        ingredients = (1...20).map { try? additionalContainer.decodeIfPresent(String.self, forKey: AdditionalKeys(stringValue: "strIngredient\($0)")!) }
        measures = (1...20).map { try? additionalContainer.decodeIfPresent(String.self, forKey: AdditionalKeys(stringValue: "strMeasure\($0)")!) }
    }
}
