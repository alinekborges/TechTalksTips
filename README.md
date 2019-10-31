# TechTalksTips

This app is a demo for the presentation at NSBrazil called `Feature Flag all things`, based on a very simplified version of Uber`s way of architecting for Feature Flags and experimentation

The main idea is that each feature can decide for each self (through a factory) if it is available or not to be used. 

## Usage

Create a factory for your feature. Your feature can be anything, from a worker, to a UIViewController or a single Button, or whatever component you use to build a feature in the architecture you are using
````
class SettingsFeatureFactory: FeatureFactory<UIViewController> {
    
    init() {
        super.init {
            return SettingsViewController()
        }
    }
    
    override func isApplicable(experiments: CachedExperimenting) -> Bool {
        //Here you return weather the feature is turned on or off depending on the context
        return experiments.isOn(Experiments.settings)
    }
    
}
````

Once you have a few features, you can use a FeaturePoint
````
class MainFeaturePoint: FeaturePoint<UIViewController> {
    
    override var featureFactories: [FeatureFactory<UIViewController>] {
        return [TipsFeatureFactory(),
                SettingsFeatureFactory()]
    }
    
}
````

To use that, just create the features. It will return an array of only the available features already built, of the same type. For example, this feature point creates the view controllers you are going to set to the tabBar
````
class MainTabViewController: UITabBarController {
    
    let featurePoint: MainFeaturePoint
    
    init(mainFeaturePoint: MainFeaturePoint) {
        self.featurePoint = mainFeaturePoint
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let features = featurePoint.createFeatures()
            .map { UINavigationController(rootViewController: $0) }
        
        self.viewControllers = features
    }
    
}
````

