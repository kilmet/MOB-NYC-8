import Foundation

enum RatingType {
    case NotYetRated, LovedIt, HatedIt
    
    func getDisplayValue() -> String{
        switch self {
        case .NotYetRated: return "Not Yet Rated"
        case .LovedIt: return "Loved it 😃"
        case .HatedIt: return "Hated it 😖"
        }
        
    }
}

class DetailedRating {
    var fileName: String
    var rating: RatingType
    var comment: String
    var time: String
    
    init(fileName: String, rating: RatingType, comment: String) {
        self.fileName = fileName
        self.rating = rating
        self.comment = comment
        
        let currentTime = NSDate()
        let timeFormatter = NSDateFormatter()
        timeFormatter.timeStyle = .MediumStyle
        
        self.time = timeFormatter.stringFromDate(currentTime)
    }
    
    func friendlyDisplay() -> String{
        return "\(fileName) - \(time) - \(rating.getDisplayValue()) - \(comment)"
    }
}





