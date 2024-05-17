//
//  CustomBackButton.swift
//  navigare
//
//  Created by Kresimir Levarda on 17.05.2024..
//

import SwiftUI

struct CustomBackButtonModifier: ViewModifier {
    var action: () -> Void
    var image: Image

    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: action) {
                        image
                    }
                }
            }
        // TODO: add custom back button action on swipe to dismiss event
    }
}

extension View {
    func customBackButton(action: @escaping () -> Void, image: Image = Image(systemName: "chevron.left.circle")) -> some View {
        self.modifier(CustomBackButtonModifier(action: action, image: image))
    }
}


extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
