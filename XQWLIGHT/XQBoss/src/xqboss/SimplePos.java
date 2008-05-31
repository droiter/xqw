/*
Position.java - Source Code for XiangQi Wizard Light, Part I

XiangQi Wizard Light - a Chinese Chess Program for Java ME
Designed by Morning Yellow, Version: 1.25, Last Modified: Mar. 2008
Copyright (C) 2004-2008 www.elephantbase.net

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/
package xqboss;

public class SimplePos {
	public static final int PIECE_KING = 0;
	public static final int PIECE_ADVISOR = 1;
	public static final int PIECE_BISHOP = 2;
	public static final int PIECE_KNIGHT = 3;
	public static final int PIECE_ROOK = 4;
	public static final int PIECE_CANNON = 5;
	public static final int PIECE_PAWN = 6;

	public static final int RANK_TOP = 3;
	public static final int RANK_BOTTOM = 12;
	public static final int FILE_LEFT = 3;
	public static final int FILE_RIGHT = 11;

	public static final String STARTUP_FEN =
			"rnbakabnr/9/1c5c1/p1p1p1p1p/9/9/P1P1P1P1P/1C5C1/9/RNBAKABNR w - - 0 1";

	public static int COORD_XY(int x, int y) {
		return x + (y << 4);
	}

	public static int SQUARE_FLIP(int sq) {
		return 254 - sq;
	}

	public static int SIDE_TAG(int sd) {
		return 8 + (sd << 3);
	}

	public static int SRC(int mv) {
		return mv & 255;
	}

	public static int DST(int mv) {
		return mv >> 8;
	}

	public static int MOVE(int sqSrc, int sqDst) {
		return sqSrc + (sqDst << 8);
	}

	public int sdPlayer;
	public byte[] squares = new byte[256];

	public void clearBoard() {
		sdPlayer = 0;
		for (int sq = 0; sq < 256; sq ++) {
			squares[sq] = 0;
		}
	}

	public void changeSide() {
		sdPlayer = 1 - sdPlayer;
	}

	public int fenPiece(char c) {
		switch (c) {
		case 'K':
			return PIECE_KING;
		case 'A':
			return PIECE_ADVISOR;
		case 'B':
		case 'E':
			return PIECE_BISHOP;
		case 'H':
		case 'N':
			return PIECE_KNIGHT;
		case 'R':
			return PIECE_ROOK;
		case 'C':
			return PIECE_CANNON;
		case 'P':
			return PIECE_PAWN;
		default:
			return -1;
		}
	}

	public void fromFen(String fen) {
		clearBoard();
		int y = RANK_TOP;
		int x = FILE_LEFT;
		int index = 0;
		if (index == fen.length()) {
			return;
		}
		char c = fen.charAt(index);
		while (c != ' ') {
			if (c == '/') {
				x = FILE_LEFT;
				y ++;
				if (y > RANK_BOTTOM) {
					break;
				}
			} else if (c >= '1' && c <= '9') {
				for (int k = 0; k < (c - '0'); k ++) {
					if (x >= FILE_RIGHT) {
						break;
					}
					x ++;
				}
			} else if (c >= 'A' && c <= 'Z') {
				if (x <= FILE_RIGHT) {
					int pt = fenPiece(c);
					if (pt >= 0) {
						squares[COORD_XY(x, y)] = (byte) (pt + 8);
					}
					x ++;
				}
			} else if (c >= 'a' && c <= 'z') {
				if (x <= FILE_RIGHT) {
					int pt = fenPiece((char) (c + 'A' - 'a'));
					if (pt >= 0) {
						squares[COORD_XY(x, y)] = (byte) (pt + 16);
					}
					x ++;
				}
			}
			index ++;
			if (index == fen.length()) {
				return;
			}
			c = fen.charAt(index);
		}
		index ++;
		if (index == fen.length()) {
			return;
		}
		if (sdPlayer == (fen.charAt(index) == 'b' ? 0 : 1)) {
			changeSide();
		}
	}
}