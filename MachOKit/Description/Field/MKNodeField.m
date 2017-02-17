//----------------------------------------------------------------------------//
//|
//|             MachOKit - A Lightweight Mach-O Parsing Library
//|             MKNodeField.m
//|
//|             D.V.
//|             Copyright (c) 2014-2015 D.V. All rights reserved.
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

#import "MKNodeField.h"
#import "MKNode.h"

//----------------------------------------------------------------------------//
@implementation MKNodeField

@synthesize name = _name;
@synthesize description = _description;
@synthesize valueRecipe = _valueRecipe;
@synthesize dataRecipe = _dataRecipe;
@synthesize valueFormatter = _valueFormatter;

//|++++++++++++++++++++++++++++++++++++|//
- (instancetype)initWithName:(NSString*)name description:(NSString*)description value:(id<MKNodeFieldValueRecipe>)valueRecipe data:(id<MKNodeFieldDataRecipe>)dataRecipe formatter:(NSFormatter*)valueFormatter options:(MKNodeFieldOptions)options
{
    self = [super init];
    if (self == nil) return nil;
    
    _name = [name copy];
    _description = [description copy];
    _valueRecipe = [valueRecipe retain];
    _dataRecipe = [dataRecipe retain];
    _valueFormatter = [valueFormatter retain];
    _options = options;
    
    return self;
}

//|++++++++++++++++++++++++++++++++++++|//
- (instancetype)init
{ @throw [NSException exceptionWithName:NSInvalidArgumentException reason:@"-init unavailable." userInfo:nil]; }

//|++++++++++++++++++++++++++++++++++++|//
- (void)dealloc
{
    [_name release];
    [_description release];
    [_valueRecipe release];
    [_dataRecipe release];
    [_valueFormatter release];
    
    [super dealloc];
}

//|++++++++++++++++++++++++++++++++++++|//
- (NSString*)formattedDescriptionForNode:(MKNode*)node
{
    id value = [_valueRecipe valueForField:self ofNode:node];
    
    if (_valueFormatter)
        return [_valueFormatter stringForObjectValue:value];
    else
        return [value description];
}

@end
