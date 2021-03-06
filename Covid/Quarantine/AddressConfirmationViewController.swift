/*-
 * Copyright (c) 2020 Sygic
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */

import UIKit
import CoreLocation
import SwiftyUserDefaults

extension AddressConfirmationViewController: HasStoryBoardIdentifier {
    static let storyboardIdentifier = "AddressConfirmationViewController"
}

final class AddressConfirmationViewController: ViewController {

    @IBOutlet private weak var streetLabel: UILabel!
    @IBOutlet private weak var cityLabel: UILabel!

    var streetText: String?
    var cityText: String?

    private let networkService = CovidService()

    override func viewDidLoad() {
        super.viewDidLoad()

        streetLabel.text = streetText
        cityLabel.text = cityText
    }

    @IBAction private func didTapConfirmButton(_ sender: Any) {
        registerFaceId()
    }

    private func registerFaceId() {
        if let navigationController = navigationController {
            let notification = StartFaceIDRegistrationNotification.notification(with: navigationController) {}
            NotificationCenter.default.post(notification)
        } else {
            preconditionFailure("Awaited navigation controller. Please consider updating the face id flow")
        }
    }

}
