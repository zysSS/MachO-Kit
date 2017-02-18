//----------------------------------------------------------------------------//
//|
//|             MachOKit - A Lightweight Mach-O Parsing Library
//! @file       MKNodeFieldValueRecipe.h
//!
//! @author     D.V.
//! @copyright  Copyright (c) 2014-2015 D.V. All rights reserved.
//|
//| Permission is hereby granted, free of charge, to any person obtaining a
//| copy of this software and associated documentation files (the "Software"),
//| to deal in the Software without restriction, including without limitation
//| the rights to use, copy, modify, merge, publish, distribute, sublicense,
//| and/or sell copies of the Software, and to permit persons to whom the
//| Software is furnished to do so, subject to the following conditions:
//|
//| The above copyright notice and this permission notice shall be included
//| in all copies or substantial portions of the Software.
//|
//| THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//| OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//| MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//| IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
//| CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
//| TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
//| SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//----------------------------------------------------------------------------//

#include <MachOKit/macho.h>
@import Foundation;

@class MKNode;
@class MKNodeField;

NS_ASSUME_NONNULL_BEGIN

//----------------------------------------------------------------------------//
//! @name       Mach-O Kit Types
//! @relates    MKNodeFieldValueRecipe
//

extern NSString * const MKFieldTypeByte;
extern NSString * const MKFieldTypeWord;
extern NSString * const MKFieldTypeDoubleWord;
extern NSString * const MKFieldTypeQuadWord;
extern NSString * const MKFieldTypePointer;
extern NSString * const MKFieldTypeBitfield;
extern NSString * const MKFieldTypeAddress;
extern NSString * const MKFieldTypeSize;
extern NSString * const MKFieldTypeOffset;
extern NSString * const MKFieldTypeCollection;




//----------------------------------------------------------------------------//
@protocol MKNodeFieldValueRecipe <NSObject>

- (nullable NSString*)typeOfField:(MKNodeField*)field ofNode:(MKNode*)input;

- (nullable id)valueForField:(MKNodeField*)field ofNode:(MKNode*)input;

@end

NS_ASSUME_NONNULL_END