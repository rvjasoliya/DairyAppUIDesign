
//  ChameleonShorthand.swift

/*
 
 The MIT License (MIT)
 
 Copyright (c) 2014-2015 Vicc Alexander.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
 */

import UIKit

// MARK: - UIColor Methods Shorthand

/**
Creates and returns a complementary flat color object 180 degrees away in the HSB colorspace from the specified color.

- parameter color: The color whose complementary color is being requested.

- returns: A flat UIColor object in the HSB colorspace.
*/
public func ComplementaryFlatColorOf(color: UIColor) -> UIColor {
    return UIColor(complementaryFlatColorOf: color)
}

/**
 Returns a randomly generated flat color object with an alpha value of 1.0 in either a light or dark shade.
 
 - parameter shade: Specifies whether the randomly generated flat color should be a light or dark shade.
 
 - returns: A flat UIColor object in the HSB colorspace.
 */
public func RandomFlatColorWithShade(shade: UIShadeStyle) -> UIColor {
    return UIColor(randomFlatColorOf: shade)
}

/**
 Creates and returns either a black or white color object depending on which contrasts more with a specified color.
 
 - parameter backgroundColor: The specified color of the contrast color that is being requested.
 - parameter returnFlat:      Pass **true** to return flat color objects.
 
 - returns: A UIColor object in the HSB colorspace.
 */
public func ContrastColorOf(backgroundColor: UIColor, returnFlat: Bool) -> UIColor {
    return UIColor(contrastingBlackOrWhiteColorOn: backgroundColor, isFlat: returnFlat)
}

/**
 Creates and returns a gradient as a color object with an alpha value of 1.0
 
 - parameter gradientStyle: Specifies the style and direction of the gradual blend between colors.
 - parameter frame:         The frame rectangle, which describes the view’s location and size in its superview’s coordinate system.
 - parameter colors:        An array of color objects used to create a gradient.
 
 - returns: A UIColor object using colorWithPattern.
 */
public func GradientColor(gradientStyle: UIGradientStyle, frame: CGRect, colors: [UIColor]) -> UIColor {
    return UIColor(gradientStyle: gradientStyle, withFrame: frame, andColors: colors)
}

public func HexColor(hexString: String, _ alpha: CGFloat = 1.0) -> UIColor {
    return UIColor(hexString: hexString, withAlpha: alpha)
}

/**
 Returns the average color generated by averaging the colors of a specified image.
 
 - parameter image: A specified UIImage.
 
 - returns: A flat UIColor object in the HSB colorspace.
 */
public func AverageColorFromImage(image: UIImage) -> UIColor {
    return UIColor(averageColorFrom: image)
}

// MARK: - Array Methods Shorthand

// TODO Array Extension needed ;)

/**
Generates and creates an array of 5 color objects in the HSB colorspace from the specified color.

- parameter colorSchemeType: The color scheme with which to select colors using a specified color.
- parameter color:           The specified color which the color scheme is built around.
- parameter isFlatScheme:    Pass *true* to return flat color objects.

- returns: An array of 5 color objects in the HSB colorspace.
*/
public func ColorSchemeOf(colorSchemeType:ColorScheme, color:UIColor, isFlatScheme:Bool) -> [UIColor] {
    return NSArray(ofColorsWith: colorSchemeType, using: color, withFlatScheme: isFlatScheme) as! [UIColor]
}

/**
Generates and creates an array of 5 color objects in the HSB colorspace that appear most often in a specified image.

- parameter image:          The specified image which the color scheme is built around.
- parameter withFlatScheme: Pass **true** to return flat color objects.

- returns: An array of 5 color objects in the HSB colorspace.
*/
public func ColorsFromImage(image: UIImage, withFlatScheme: Bool) -> [UIColor] {
    // TODO: Remove forced casting
    return NSArray(ofColorsFrom: image, withFlatScheme: withFlatScheme) as! [UIColor]
}


// MARK: - Special Colors Shorthand

/**
Returns a randomly generated flat color object whose alpha value is 1.0.

- returns: A flat UIColor object in the HSB colorspace.
*/
public func RandomFlatColor() -> UIColor {
    return UIColor.randomFlat()
}

public func ClearColor() -> UIColor {
    return UIColor.clear
}


// MARK: - Light Shades Shorthand

public func FlatBlack() -> UIColor {
    return UIColor.flatBlack() 
}

public func FlatBlue() -> UIColor {
    return UIColor.flatBlue()
}

public func FlatBrown() -> UIColor {
    return UIColor.flatBrown()
}

public func FlatCoffee() -> UIColor {
    return UIColor.flatCoffee()
}

public func FlatForestGreen() -> UIColor {
    return UIColor.flatForestGreen()
}

public func FlatGray() -> UIColor {
    return UIColor.flatGray()
}

public func FlatGreen() -> UIColor {
    return UIColor.flatGreen()
}

public func FlatLime() -> UIColor {
    return UIColor.flatLime()
}

public func FlatMagenta() -> UIColor {
    return UIColor.flatMagenta()
}

public func FlatMaroon() -> UIColor {
    return UIColor.flatMaroon()
}

public func FlatMint() -> UIColor {
    return UIColor.flatMint()
}

public func FlatNavyBlue() -> UIColor {
    return UIColor.flatNavyBlue()
}

public func FlatOrange() -> UIColor {
    return UIColor.flatOrange()
}

public func FlatPink() -> UIColor {
    return UIColor.flatPink()
}

public func FlatPlum() -> UIColor {
    return UIColor.flatPlum()
}

public func FlatPowderBlue() -> UIColor {
    return UIColor.flatPowderBlue()
}

public func FlatPurple() -> UIColor {
    return UIColor.flatPurple()
}

public func FlatRed() -> UIColor {
    return UIColor.flatRed()
}

public func FlatSand() -> UIColor {
    return UIColor.flatSand()
}

public func FlatSkyBlue() -> UIColor {
    return UIColor.flatSkyBlue()
}

public func FlatTeal() -> UIColor {
    return UIColor.flatTeal()
}

public func FlatWatermelon() -> UIColor {
    return UIColor.flatWatermelon()
}

public func FlatWhite() -> UIColor {
    return UIColor.flatWhite()
}

public func FlatYellow() -> UIColor {
    return UIColor.flatYellow()
}

// MARK: - Chameleon - Dark Shades Shorthand

public func FlatBlackDark() -> UIColor {
	return UIColor.flatBlackColorDark() 
}

public func FlatBlueDark() -> UIColor {
	return UIColor.flatBlueColorDark() 
}

public func FlatBrownDark() -> UIColor {
	return UIColor.flatBrownColorDark() 
}

public func FlatCoffeeDark() -> UIColor {
	return UIColor.flatCoffeeColorDark() 
}

public func FlatForestGreenDark() -> UIColor {
	return UIColor.flatForestGreenColorDark() 
}

public func FlatGrayDark() -> UIColor {
	return UIColor.flatGrayColorDark() 
}

public func FlatGreenDark() -> UIColor {
	return UIColor.flatGreenColorDark() 
}

public func FlatLimeDark() -> UIColor {
	return UIColor.flatLimeColorDark() 
}

public func FlatMagentaDark() -> UIColor {
	return UIColor.flatMagentaColorDark() 
}

public func FlatMaroonDark() -> UIColor {
	return UIColor.flatMaroonColorDark() 
}

public func FlatMintDark() -> UIColor {
	return UIColor.flatMintColorDark() 
}

public func FlatNavyBlueDark() -> UIColor {
	return UIColor.flatNavyBlueColorDark() 
}

public func FlatOrangeDark() -> UIColor {
	return UIColor.flatOrangeColorDark() 
}

public func FlatPinkDark() -> UIColor {
	return UIColor.flatPinkColorDark() 
}

public func FlatPlumDark() -> UIColor {
	return UIColor.flatPlumColorDark() 
}

public func FlatPowderBlueDark() -> UIColor {
	return UIColor.flatPowderBlueColorDark() 
}

public func FlatPurpleDark() -> UIColor {
	return UIColor.flatPurpleColorDark() 
}

public func FlatRedDark() -> UIColor {
	return UIColor.flatRedColorDark() 
}

public func FlatSandDark() -> UIColor {
	return UIColor.flatSandColorDark() 
}

public func FlatSkyBlueDark() -> UIColor {
	return UIColor.flatSkyBlueColorDark() 
}

public func FlatTealDark() -> UIColor {
	return UIColor.flatTealColorDark() 
}

public func FlatWatermelonDark() -> UIColor {
	return UIColor.flatWatermelonColorDark() 
}

public func FlatWhiteDark() -> UIColor {
	return UIColor.flatWhiteColorDark() 
}

public func FlatYellowDark() -> UIColor {
	return UIColor.flatYellowColorDark() 
}
