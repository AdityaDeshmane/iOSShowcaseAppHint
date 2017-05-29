# iOSShowcaseAppHint
iOS Showcase / App Hint customisable view control


![      ](/WithoutShowcase.png "")       ![      ](/WithShowcase.png "") 


* Generic code 
* Easy to modify 
* No image assets used, graphics redered using core graphics 

<em>This UI control can be used on all iPhones, iPods & iPads running iOS 5.0 and above.</em>

---
---

### Adding to your project


* Add Follwing three control files to your project

```
'ADShowcaseViewController.h'
'ADShowcaseViewController.m'
'ADShowcaseView.xib'
```

---
---

### How to use

#### Sample Code

```obj-c

//1. IMPORT
  #import "ADShowcaseViewController.h"

//2. CREATING INSTANCE OF CONTROL
  ADShowcaseViewController *_vcADShowcase; //Declare
  _vcADShowcase = [ADShowcaseViewController new]; //Initialize

//3. CONFIGURE
  _vcADShowcase.pointToHightlight = CGPointMake(150, 250);
  _vcADShowcase.strTitle = @"New!!!";
  _vcADShowcase.strMessage = @"Hey, check out this new cool feature..";
  _vcADShowcase.strRemoveViewButtonTitle = @"Got it";    

//4. ADD AS SUBVIEW
  [self.view addSubview:_vcADShowcase.view];//Either on view or window (window recommended)


```


---
---

### Requirements

ADShowcaseViewController works on iOS 5.0 & above versions and is compatible with ARC projects. There is no need of other frameworks/libraries

---
---

### Other details

* XCode : Developed using 6.1
* Base sdk used while development : 8.1
* Testing : iOS: 6,7,8   Devices : iPad & 3.5, 4, 4.7, 5.5 inch iphones

---
---

### TODO

* Component polishing
* More generalizations

---
---
