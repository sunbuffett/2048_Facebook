//
//  BoardTest.m
//  2048 FB
//
//  Created by Shuyang Sun on 4/5/14.
//  Copyright (c) 2014 Shuyang Sun. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GameManager+ModelLayer03.h"
#import "History+ModelLayer03.h"
#import "Board+ModelLayer03.h"
#import "Tile+ModelLayer03.h"

@interface BoardTest : XCTestCase

@property (nonatomic, strong) Board *board;
// Set this parameter to YES if want to see ASCII board info
@property (nonatomic) BOOL printBoard;

@end

@implementation BoardTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
	[GameManager initializeGameManager];
	[History initializeNewHistory];
	[Board initializeNewBoard];
	[Tile initializeAllTiles];
	self.board = [[Board allBoards] lastObject];
	self.printBoard = YES;
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
	// Remove all boards:
	NSArray *arr = [Board allBoards];
	for (Board *b in arr) {
		[Board removeBoardWithUUID:b.uuid];
	}
	// Remove all Game managers:
	arr = [GameManager allGameManagers];
	for (GameManager *g in arr) {
		[GameManager removeGameManagerWithUUID:g.uuid];
	}
	// Remove all Tiles:
	arr = [Tile allTiles];
	for (Tile *t in arr) {
		[Tile removeTileWithValue:t.value];
	}
}

-(void)testBoardExist {
	XCTAssertNotNil(self.board);
}

-(void)testBoardGamePLaying {
	XCTAssertTrue(self.board.gameplaying);
	self.board.gameplaying = NO;
	XCTAssertFalse(self.board.gameplaying);
}

-(void)testBoardScore {
	XCTAssertEqual(self.board.score, 0);
	int32_t score = 4;
	self.board.score = score;
	XCTAssertEqual(self.board.score, 4);
}

-(void)testBoardsRemoveBoard {
	NSArray *arr = [Board allBoards];
	for (Board *b in arr) {
		[Board removeBoardWithUUID:b.uuid];
	}
	arr = [Board allBoards];
	NSUInteger count = [arr count];
	XCTAssertTrue(count == 0);
}

-(void)testBoardData {
	id obj = [NSKeyedUnarchiver unarchiveObjectWithData:self.board.boardData];
	XCTAssertTrue([obj isKindOfClass:[NSArray class]]);
	NSArray *arr = obj;
	for (int i = 0; i < 4; ++i) {
		for (int j = 0; j < 4; ++j) {
			int16_t val = [arr[i][j] intValue];
			XCTAssertTrue(val == 0 || val == 2 || val == 4);
		}
		int swipeStateVal = self.board.swipeDirection;
		XCTAssertTrue(swipeStateVal >= 0 && swipeStateVal < 4);
	}
}

-(void)testSwipeBoardLeft {
	if (self.printBoard) { NSLog(@"Swipe Left Tests"); }
	Board *temp;
	// NOTE: We are always printing the previouse board!
	// 1.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionLeft];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionLeft);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 2.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionLeft];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionLeft);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 3.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionLeft];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionLeft);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 4.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionLeft];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionLeft);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 5.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionLeft];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionLeft);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	
	if (self.printBoard) { [self.board printBoard]; }
}

-(void)testSwipeBoardRight {
	if (self.printBoard) { NSLog(@"Swipe Right Tests"); }
	Board *temp;
	// NOTE: We are always printing the previouse board!
	// 1.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionRight];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionRight);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 2.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionRight];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionRight);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 3.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionRight];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionRight);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 4.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionRight];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionRight);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 5.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionRight];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionRight);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	
	if (self.printBoard) { [self.board printBoard]; }
}

-(void)testSwipeBoardUp {
	if (self.printBoard) { NSLog(@"Swipe Up Tests"); }
	Board *temp;
	// NOTE: We are always printing the previouse board!
	// 1.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionUp];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionUp);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 2.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionUp];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionUp);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 3.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionUp];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionUp);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 4.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionUp];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionUp);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 5.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionUp];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionUp);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);

	if (self.printBoard) { [self.board printBoard]; }
}

-(void)testSwipeBoardDown {
	if (self.printBoard) { NSLog(@"Swipe Down Tests"); }
	Board *temp;
	// NOTE: We are always printing the previouse board!
	// 1.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionDown];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionDown);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 2.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionDown];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionDown);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 3.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionDown];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionDown);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 4.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionDown];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionDown);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 5.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionDown];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionDown);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	
	if (self.printBoard) { [self.board printBoard]; }
}

-(void)testSwipeBoardMix {
	if (self.printBoard) { printf("Swipe Mix Tests\n"); }
	Board *temp;
	// NOTE: We are always printing the previouse board!
	// 1.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionLeft];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionLeft);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 3.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionLeft];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionLeft);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 4
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionRight];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionRight);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 5
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionUp];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionUp);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 6
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionDown];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionDown);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 7
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionRight];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionRight);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 8.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionLeft];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionLeft);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 9.
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionLeft];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionLeft);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 10
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionRight];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionRight);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 11
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionUp];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionUp);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 12
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionDown];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionDown);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
	// 13
	temp = [self.board swipedToDirection:BoardSwipeGestureDirectionRight];
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionRight);
	if (self.printBoard) { [self.board printBoard]; }
	self.board = temp;
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);

	// 14
	if (self.printBoard) { [self.board printBoard]; }
	XCTAssertEqual(self.board.swipeDirection, BoardSwipeGestureDirectionNone);
}

@end
