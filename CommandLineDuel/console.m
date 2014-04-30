//
//  console.m
//  ConsoleIO
//
//  Created by David Groulx on 4/24/14.
//  Copyright (c) 2014 David Groulx. All rights reserved.
//

#import "console.h"

@import Foundation;

int getIntegerFromConsole() {
  NSFileHandle *fileHandle = [NSFileHandle fileHandleWithStandardInput];
  NSData *inputData;
  NSString *inputString;

  inputData = [fileHandle availableData];
  inputString = [[NSString alloc] initWithData: inputData encoding:NSUTF8StringEncoding];
  return [inputString intValue];
}

float getDecimalFromConsole() {
  NSFileHandle *fileHandle = [NSFileHandle fileHandleWithStandardInput];
  NSData *inputData;
  NSString *inputString;
  
  inputData = [fileHandle availableData];
  inputString = [[NSString alloc] initWithData: inputData encoding:NSUTF8StringEncoding];
  return [inputString floatValue];
}

NSString* getStringFromConsole() {
  NSFileHandle *fileHandle = [NSFileHandle fileHandleWithStandardInput];
  NSData *inputData;
  NSString *inputString;
  
  inputData = [fileHandle availableData];
  inputString = [[NSString alloc] initWithData: inputData encoding:NSUTF8StringEncoding];
  return inputString;
}

