import UIKit
import CustomIntensityVisualEffectView

class View: UIView {

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        addSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    // MARK: Subviews

    let imageView = Subview.imageView
    let visualEffectView = Subview.visualEffectView
    let slider = Subview.slider

    private let containerView = UIView(frame: .zero)

    private func addSubviews() {
        addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(visualEffectView)
        addSubview(slider)
    }

    // MARK: Layout

    private func setupLayout() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true

        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        visualEffectView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        visualEffectView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true

        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 32).isActive = true
        slider.leftAnchor.constraint(equalTo: leftAnchor, constant: 32).isActive = true
        slider.rightAnchor.constraint(equalTo: rightAnchor, constant: -32).isActive = true
        slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32).isActive = true
    }

}

private extension View {
    struct Subview {
        static var imageView: UIImageView {
            let view = UIImageView(image: #imageLiteral(resourceName: "antrykot"))
            view.contentMode = .scaleAspectFit
            return view
        }

        static var visualEffectView: CustomIntensityVisualEffectView {
            return CustomIntensityVisualEffectView(effect: nil, intensity: 1)
        }

        static var slider: UISlider {
            let slider = UISlider(frame: .zero)
            slider.isContinuous = true
            slider.minimumValue = 0
            slider.maximumValue = 1
            return slider
        }
    }
}