// swiftlint:disable function_body_length
import Quick
import Nimble
import Pyramid

class TupleFlatteningSpec: QuickSpec {
    override func spec() {
        it("flattens") {
		
			expect(flatten(((1, 2), 3)) == (1, 2, 3)).to(beTrue())
		
			expect(flatten((((1, 2), 3), 4)) == (1, 2, 3, 4)).to(beTrue())
		
			expect(flatten(((((1, 2), 3), 4), 5)) == (1, 2, 3, 4, 5)).to(beTrue())
		
			expect(flatten((((((1, 2), 3), 4), 5), 6)) == (1, 2, 3, 4, 5, 6)).to(beTrue())
		
		}
    }
}
