# Comet

Falling Comet Animation for swift 


![6418E0B4-B33B-44A4-A377-EAC38353703F](https://user-images.githubusercontent.com/17967553/150632175-5d838212-53a4-4bae-8f6a-5996961cf775.GIF)


How to use
## Getting Start
Drage and drop CometAnimationScript to your project 

use this code for comet 

```swift
CometAnimation.startAnimation(startPoint: CGPoint(x: 100, y: 0),
                                      endPoint: CGPoint(x: 0, y: 100),
                                      lineColor: UIColor.white.withAlphaComponent(0.2),
                                      cometColor: UIColor.white , parentLayer: view.layer)
```

Tips:
- make line color ```.clear``` if you dont want lines 
- here ```view``` is your main view 





