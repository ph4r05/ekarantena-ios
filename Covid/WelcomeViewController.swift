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

//
//  WelcomeViewController.swift
//  Covid
//
//  Created by Boris Kolozsi on 12/03/2020.
//

import UIKit
import SwiftyUserDefaults

extension WelcomeViewController: HasStoryBoardIdentifier {
    static let storyboardIdentifier = "WelcomeViewController"
}

final class WelcomeViewController: ViewController {

    @IBOutlet private var agreeButton: UIButton!

    var onAgree: (() -> Void)?

    override func loadView() {
        super.loadView()

        agreeButton.layer.cornerRadius = 20
        agreeButton.layer.masksToBounds = true

        if Defaults.deviceId.isEmpty {
            Defaults.deviceId = UUID().uuidString
        }
    }

    @IBAction private func agreeDidTap(_ sender: Any) {
        onAgree?()
    }
}
