//
//  CustomBackButton.swift
//  navigare
//
//  Created by Kresimir Levarda on 17.05.2024..
//

import SwiftUI

enum Constants {
    static let maxStartLocation: CGFloat = 10
    static let maxOffsetX: CGFloat = 35
    static let opacityMaxOffsetX: CGFloat = 100
}

struct CustomBackButtonModifier: ViewModifier {
    let action: () -> Void
    let image: Image

    @State private var offsetX: CGFloat = .zero

    private var opacity: Double {
        Double(1 - (offsetX / Constants.opacityMaxOffsetX))
    }

    func body(content: Content) -> some View {
        content
            .offset(x: offsetX)
            .opacity(opacity)
            .gesture(dragGesture)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: action) {
                        image
                            .opacity(opacity)
                    }
                }
            }
    }

    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                guard value.startLocation.x < Constants.maxStartLocation else { return }

                withAnimation(.linear(duration: 0.1)) {
                    offsetX = value.translation.width
                }

                if offsetX >= Constants.maxOffsetX {
                    resetOffset()
                    action()
                }
            }
            .onEnded { value in
                resetOffset()
            }
    }

    private func resetOffset() {
        withAnimation(.easeInOut) {
            offsetX = .zero
        }
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
