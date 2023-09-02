//
//  WeatherAPI.swift
//  lesson 303
//
//  Created by Garib Agaev on 01.09.2023.
//

import Foundation

struct Location: Decodable, Equatable {
    let lat: Double
    let lon: Double
    let name: String
    let region: String
    let country: String
    let tzId: String?
    let localtimeEpoch: Int?
    let localtime: String?
    
    static func ==(left: Location, right: Location) -> Bool {
        left.name == right.name && left.country == right.country && left.region == right.region
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case region = "region"
        case country = "country"
        case lat = "lat"
        case lon = "lon"
        case tzId = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime = "localtime"
    }
}

struct WeatherAlerts: Decodable {
    let headline: String
    let msgType: String
    let severity: String
    let urgency: String
    let areas: String
    let category: String
    let certainty: String
    let event: String
    let note: String
    let effective: String
    let expires: String
    let desc: String
    let instruction: String
}

struct AirQualityData: Decodable {
    let co: Double
    let o3: Double
    let no2: Double
    let so2: Double
    let pm2_5: Double
    let pm10: Double
    let usEpaIndex: Int
    let gbDefraIndex: Int

    enum CodingKeys: String, CodingKey {
        case co = "co"
        case o3 = "o3"
        case no2 = "no2"
        case so2 = "so2"
        case pm2_5 = "pm2_5"
        case pm10 = "pm10"
        case usEpaIndex = "us_epa_index"
        case gbDefraIndex = "gb_defra_index"
    }
}

struct Condition: Decodable {
    let text: String
    let icon: String
    let code: Int
}

struct Current: Decodable {
    let lastUpdated: String
    let lastUpdatedEpoch: Int
    let tempC: Double
    let tempF: Double
    let feelslikeC: Double
    let feelslikeF: Double
    let condition: Condition
    let windMph: Double
    let windKph: Double
    let windDegree: Int
    let windDir: String
    let pressureMb: Double
    let pressureIn: Double
    let precipMm: Double
    let precipIn: Double
    let humidity: Int
    let cloud: Int
    let isDay: Int
    let uv: Double
    let gustMph: Double
    let gustKph: Double
    
    enum CodingKeys: String, CodingKey {
        case lastUpdated = "last_updated"
        case lastUpdatedEpoch = "last_updated_epoch"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case condition = "condition"
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMb = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity = "humidity"
        case cloud = "cloud"
        case isDay = "is_day"
        case uv = "uv"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}

struct DayElement: Decodable {
    let maxtempC: Double
    let maxtempF: Double
    let mintempC: Double
    let mintempF: Double
    let avgtempC: Double
    let avgtempF: Double
    let maxwindMph: Double
    let maxwindKph: Double
    let totalprecipMm: Double
    let totalprecipIn: Double
    let avgvisKm: Double
    let avgvisMiles: Double
    let avghumidity: Int
    let condition: Condition
    let uv: Double
    
    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwindMph"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "pressureMb"
        case totalprecipIn = "pressure_in"
        case avgvisKm = "avgvis_km"
        case avgvisMiles = "avgvisMiles"
        case avghumidity = "avghumidity"
        case condition = "condition"
        case uv = "uv"
    }
}

struct AstroElement: Decodable {
    let sunrise: String
    let sunset: String
    let moonrise: String
    let moonset: String
    let moonPhase: String
    let moonIllumination: String
    
    enum CodingKeys: String, CodingKey {
        case sunrise = "sunrise"
        case sunset = "sunset"
        case moonrise = "moonrise"
        case moonset = "moonset"
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
    }
}

struct TidesElement: Decodable {
    let tideTime: String
    let tideHeightMt: Double
    let tideType: Double
    
    enum CodingKeys: String, CodingKey {
        case tideTime = "tide_time"
        case tideHeightMt = "tide_height_mt"
        case tideType = "tide_type"
    }
}

struct HourElement: Decodable {
    let timeEpoch: Int
    let time: String
    let tempC: Double
    let tempF: Double
    let condition: Condition
    let windMph: Double
    let windKph: Double
    let windDegree: Int
    let windDir: String
    let pressureMb: Double
    let pressureIn: Double
    let precipMm: Double
    let precipIn: Double
    let humidity: Int
    let cloud: Int
    let feelslikeC: Double
    let feelslikeF: Double
    let windchillC: Double
    let windchillF: Double
    let heatindexC: Double
    let heatindexF: Double
    let dewpointC: Double
    let dewpointF: Double
    let willItRain: Int
    let willItSnow: Int
    let isDay: Int
    let visKm: Double
    let visMiles: Double
    let chanceOfRain: Int
    let chanceOfSnow: Int
    let gustMph: Double
    let gustKph: Double
    let uv: Double
    
    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time = "time"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case condition = "condition"
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMb = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity = "humidity"
        case cloud = "cloud"
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case willItRain = "will_it_rain"
        case willItSnow = "will_it_snow"
        case isDay = "is_day"
        case visKm = "vis_km"
        case visMiles = "vis_miles"
        case chanceOfRain = "chance_of_rain"
        case chanceOfSnow = "chance_of_snow"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case uv = "uv"
    }
}

struct Forecastday: Decodable {
    let date: String
    let dateEpoch: Int
    let day: DayElement
    let astro: AstroElement
    let tides: TidesElement?
    let hour: [HourElement]
    
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case dateEpoch = "date_epoch"
        case day = "day"
        case astro = "astro"
        case tides = "tides"
        case hour = "hour"
    }
}

struct Forecast: Decodable {
    let forecastday: [Forecastday]
}

struct SportEvent: Decodable {
    let stadium: String
    let country: Int
    let region: String
    let tournament: String
    let start: String
    let match: String
}

struct RealtimeAPI: Decodable {
    let location: Location
    let current : Current
}

struct ForecastAPI: Decodable {
    let location: Location
    let forecast: Forecast
}

struct HistoryAPI {
    //?
}

struct MarineWeatherAPI: Decodable {
    let location: Location
    let forecast: Forecast
}

struct FutureWeatherAPI: Decodable {
    let location: Location
    let forecast: Forecast
}

typealias SearchAutocompleteAPI = [Location]

struct IPLookupAPI: Decodable {
    //?
}

struct AstronomyAPI: Decodable{
    let location: Location
    let astro: AstroElement
}

struct TimeZoneAPI: Decodable {
    let location: Location
}

struct SportsAPI: Decodable {
    let football: [SportEvent]
    let cricket: [SportEvent]
    let golf: [SportEvent]
}

//class Properties {
//    static let shared = Progress()
//
//    private let key = "4b17f00db3804d03965140234233108"
//    private let baseURL = "http://api.weatherapi.com/v1"
//    let langName = [
//        "Arabic": "ar",
//        "Bengali": "bn",
//        "Bulgarian": "bg",
//        "Chinese Simplified": "zh",
//        "Chinese Traditional": "zh_tw",
//        "Czech": "cs",
//        "Danish": "da",
//        "Dutch": "nl",
//        "Finnish": "fi",
//        "French": "fr",
//        "German": "de",
//        "Greek": "el",
//        "Hindi": "hi",
//        "Hungarian": "hu",
//        "Italian": "it",
//        "Japanese": "ja",
//        "Javanese": "jv",
//        "Korean": "ko",
//        "Mandarin": "zh_cmn",
//        "Marathi": "mr",
//        "Polish": "pl",
//        "Portuguese": "pt",
//        "Punjabi": "pa",
//        "Romanian": "ro",
//        "Russian": "ru",
//        "Serbian": "sr",
//        "Sinhalese": "si",
//        "Slovak": "sk",
//        "Spanish": "es",
//        "Swedish": "sv",
//        "Tamil": "ta",
//        "Telugu": "te",
//        "Turkish": "tr",
//        "Ukrainian": "uk",
//        "Urdu": "ur",
//        "Vietnamese": "vi",
//        "Wu (Shanghainese)": "zh_wuu",
//        "Xiang": "zh_hsn",
//        "Yue (Cantonese)": "zh_yue",
//        "Zulu": "zu"
//    ]
//
//    func getURL() {
//
//    }
//
//
//    private init() {}
//}
