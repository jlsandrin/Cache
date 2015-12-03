import Quick
import Nimble

class ExpirySpec: QuickSpec {

  override func spec() {
    describe("Expiry") {
      var expiry: Expiry!

      describe("#date") {
        it("returns date in the distant future") {
          let date = NSDate.distantFuture()
          expiry = .Never

          expect(expiry.date).to(equal(date))
        }

        it("returns date by adding time interval") {
          let date = NSDate().dateByAddingTimeInterval(1000)
          expiry = .Seconds(1000)

          expect(expiry.date.timeIntervalSince1970) ≈ (date.timeIntervalSince1970, 0.01)
        }

        it("returns specified date") {
          let date = NSDate().dateByAddingTimeInterval(1000)
          expiry = .Date(date)
          
          expect(expiry.date).to(equal(date))
        }
      }
    }
  }
}