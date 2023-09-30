# Text Widget

## Intro
This repo is meant to detail and provide a fix to flutter issues with rendering text/emojis correctly on iOS.


https://github.com/delfme/text-widget/assets/53510751/64e88ac1-2ec1-47b8-bb62-a14b148e4108



## Solution
A formula to correct the rendering issue is implemented. 
More precisely, a correction to emoji `fontsize` will require a correction to text `height` property.
A vertical `offset` must also be applied to the resized emojis so that they can match the native-like baseline (which breaks after the resize).
`Letterspacing` must be also corrected for both emojis and text.

## Remarks
Following points should be considered for a transposition of the fix to flutter engine.
- Skia seems to fail to proper render text as well, that is mostly in terms of height and letterSpacing.
- it is impossible to have a unique formula for scaling, repositioning and shrinking text/emojis at once, see paragraph below.

## Formula
The fix comprises a set of property adjustments (2 for text and 3 for emojis), which are:
- text `letterspacing`
- text `height`
- emoji `fontsize`
- emoji `letterspacing`
- emoji `offset` (to correct baseline after increasing emoji size)

The best way to fix issue is to calculate all the adjustments from text `fontsize`, which will be the only fixed input.
Several intervals have been created for each of above adjustments.

```
 if (style!.fontSize < 8)
 if (style!.fontSize >= 8 && style!.fontSize < 12)
 if (style!.fontSize >= 12 && style!.fontSize < 15)
 if (style!.fontSize >= 15 && style!.fontSize < 16)
 if (style!.fontSize >= 16 && style!.fontSize < 18)
 if (style!.fontSize >= 18 && style!.fontSize < 20)
 if (style!.fontSize >= 20 && style!.fontSize < 25)
 if (style!.fontSize >= 25 && style!.fontSize < 27)
 if (style!.fontSize >= 27  && style!.fontSize < 30)
 if (style!.fontSize >= 30  && style!.fontSize < 35)
 if (style!.fontSize >= 35  && style!.fontSize < 48)
 if (style!.fontSize >= 48  && style!.fontSize < 58)
 if (style!.fontSize >= 58)
```

Each adjustment has a different set of intervals, the one written above is the biggest one.
Usually 6-7 conditions per set are all we need.
It is worth noticing that Apple gives a special attention to the fontsize between 15-20pt.
This is because these are the sizes the user sees most of time while using the device.

## Conclusion
The current solution provides 97-99% fidelity to native UI.
Other issues also impact the final result:
1) Impeller still not rendering text with 100% fidelity, ie. https://github.com/flutter/flutter/issues/120857  
2) Emoji being offcentred https://github.com/flutter/flutter/issues/119623#issuecomment-1535669615
3) As strange as it might sound, it is harder to get a perfect match on android. Becuase the ecosystem is much fragmented and emojis sets are different. However, the result is always as much good as that user cannot notice any strangeness. 
4) Numbers can still be improved, altough it would be such a slighty correction that wouldnt make the difference for the good or bad.
5) Numbers are intertwined. So for example, if emoji `fontize` is changed, that would require a further correction to text `letterSpacing` and text `height`. 

## Mantainance
Having to adjust 5 properties (2 properties for text and 3 properties for emojis) with current mapping requires just changing a few numbers.
Eventual correction would also be minimal, like if letterSpacing is 0.85, the new value might be 0.95 or 0.75.
This is to say that correction would be manual, yet easy stuff.

However, it is unlikely that Apple/Google will change the way they render emojis.
In the future we might imagine that all emojis will be lottie animations.
That would prolly be the next moment when we should apply corrections.

## Android
We do apply a slight correction also on android, although it might not be needed and not be consistent on all devices. Emojis size is almost correct on android (apart fontsize range 16-18pt) but we noticed that text `height` and `letterSpacing` is not perfect.




