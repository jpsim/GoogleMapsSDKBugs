import GoogleMaps
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
    {
        GMSServices.provideAPIKey("API Key Here")
        let rootViewController = GoogleMapsBugViewController()
        let window = UIWindow()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

// MARK: - View Controller

final class GoogleMapsBugViewController: UIViewController, GMSMapViewDelegate {
    let mapView = GMSMapView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.mapView)
        self.mapView.frame = self.view.bounds
        self.mapView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.triggerBug()
    }

    func triggerBug() {
        CATransaction.begin()
        // Arbitrary coordinate
        let target = CLLocationCoordinate2D(latitude: 37.776513, longitude: -122.392036)
        self.mapView.animate(with: .setTarget(target))
        CATransaction.commit()
        self.mapView.stopAndRemoveAllAnimations()
    }

    // MARK: - GMSMapViewDelegate

    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        print("Map will move. Gesture: \(gesture)")
    }
}

extension GMSMapView {
    func stopAndRemoveAllAnimations() {
        let selector = "stopAndRemoveAllAnimations"
        let underlyingMapView = self.value(forKey: "mapView") as? UIView
        underlyingMapView?.perform(Selector(selector))
    }
}
