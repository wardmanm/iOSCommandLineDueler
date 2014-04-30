//
//  main.m
//  CommandLineDuel
//
//  Created by Mike Wardo on 4/30/14.
//  Copyright (c) 2014 WARDMANM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>
#import "console.h"

//global variable declaration
NSString *playerName; // player name
NSString *enemyName; // enemy name
int playerHP = 10; // player hitpoints
int enemyHP; //enemy hitpoints
bool gameOver = false; // is the game over?

//this function generates a random enemy name and set of hitpoints
void enemyGen(void){
    //local variable for use of enemy generation
    int nameGen = 0;
    
    //takes a random number and creates an enemy from it
    sranddev();
    nameGen = rand() % 4 + 1;
    if (nameGen == 1){
        enemyName = @"Jim the Destroyer";
        enemyHP = 10;
    } else if (nameGen == 2){
        enemyName = @"Dave the Mad";
        enemyHP = 5;
    } else if (nameGen == 3){
        enemyName = @"Greg the Weakling";
        enemyHP = 3;
    } else {
        enemyName = @"Howard the Duck";
        enemyHP = 1;
    }
}

//function to calculate randomized damage
int damageGen(int damage){
    int damageAmt = 0; //random damage amount
    sranddev();
    damageAmt = rand() % 5 + 1;
    
    return damageAmt;
}

//function called when player takes a swing
void playerSwing(void){
int damage = 0;
    damage = damageGen(damage);
    NSLog(@"\n \n  You swing at %@ and do %i damage. \n \n", enemyName, damage);
    enemyHP = enemyHP - damage;
    if (enemyHP <= 0){
        NSLog(@"\n \n  You have defeated %@!!! You win! \n \n", enemyName);
        gameOver = true;
    } else {
        damage = damageGen(damage);
        NSLog(@"\n \n %@ swings back and hits you for %i damage. \n \n", enemyName, damage);
        playerHP = playerHP - damage;
        if (playerHP <= 0){
            NSLog(@"\n \n %@ has killed you.  You lose. \n \n", enemyName);
            gameOver = true;
        }
    }
}

//function called when player does nothing
void doNothing(void){
    int damage = 0;
    damage = damageGen(damage);
    NSLog(@"\n \n You stand there staring into space. \n \n %@ swings and hits you for %i damage. \n \n", enemyName, damage);
    playerHP = playerHP - damage;
    if (playerHP <= 0){
        NSLog(@"\n \n %@ has killed you.  You lose. \n \n", enemyName);
        gameOver = true;
    }
}

//Main function
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        //calls functions to set up game
        enemyGen();
        
        //Initial Greeting
        NSLog(@"Welcome to Command Line Duel! \n Please enter your name: \n");
        playerName = getStringFromConsole();
        NSLog(@"\n \n Greetings %@ \n \n Today you will be dueling %@. He has %i hitpoints. You have %i. \n Take him down to zero and win, let him hit you to zero and you lose! \n \n Good Luck.", playerName, enemyName, enemyHP, playerHP);
        
        // the main while loop that will continue until player wins or loses
        while (!gameOver) {
            int playerChoice = 0; // loop variable to log player choice
            
            NSLog(@"\n \n You have %i HP. %@ has %i HP. ", playerHP, enemyName, enemyHP);
            NSLog(@"\n \n  Type '1' if you'd like to take a swing at %@. Type '2' if you'd like to do nothing.\n \n", enemyName);
            
            // main section of the game, logs player choice and points to pertinent functions for hits and checks for game over
            playerChoice = getIntegerFromConsole();
            if (playerChoice == 1){
                playerSwing();
            } else if (playerChoice == 2){
                doNothing();
            } else {
                NSLog(@"You did not choose anything, try again.");
            }
            
        }
        
    }
    return 0;
}

