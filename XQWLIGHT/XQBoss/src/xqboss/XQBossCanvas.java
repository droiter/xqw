/*
XQWLCanvas.java - Source Code for XiangQi Wizard Light, Part IV

XiangQi Wizard Light - a Chinese Chess Program for Java ME
Designed by Morning Yellow, Version: 1.26, Last Modified: May 2008
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

import javax.microedition.lcdui.Alert;
import javax.microedition.lcdui.AlertType;
import javax.microedition.lcdui.Canvas;
import javax.microedition.lcdui.Display;
import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.Graphics;
import javax.microedition.lcdui.Image;

class XQBossCanvas extends Canvas {
	private static Image imgBackground, imgXQBoss;
	private static final String[] IMAGE_NAME = {
		null, null, null, null, null, null, null, null,
		"rk", "ra", "rb", "rn", "rr", "rc", "rp", null,
		"bk", "ba", "bb", "bn", "br", "bc", "bp", null,
	};
	private static int widthBackground, heightBackground;
	private static Font fontSmall = Font.getFont(Font.FACE_SYSTEM,
			Font.STYLE_BOLD, Font.SIZE_SMALL);

	static {
		try {
			imgBackground = Image.createImage("/images/background.png");
			imgXQBoss = Image.createImage("/images/xqboss.png");
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		widthBackground = imgBackground.getWidth();
		heightBackground = imgBackground.getHeight();
	}

	XQBossMIDlet midlet;

	private PgnFile pgn;
	private int index;
	// Assume FullScreenMode = false
	private int normalWidth = getWidth();
	private int normalHeight = getHeight();

	private Alert altAbout = new Alert("关于\"象棋小博士\"", null, imgXQBoss, AlertType.INFO);

	private boolean init = false, loading = true;
	private Image imgBoard;
	private Image[] imgPieces = new Image[24];
	private int squareSize, width, height, left, top;

	XQBossCanvas(XQBossMIDlet midlet_) {
		midlet = midlet_;
		setFullScreenMode(true);
		altAbout.setTimeout(Alert.FOREVER);
		altAbout.setString(midlet.getAppProperty("MIDlet-Description") +
				"\n\r\f象棋百科全书 荣誉出品\n\r\f\n\r\f" +
				"(C) 2004-2008 www.elephantbase.net\n\r\f本产品符合GNU通用公共许可协议\n\r\f\n\r\f" +
				"欢迎登录 www.elephantbase.net\n\r\f免费下载PC版 象棋巫师");
	}

	void load(PgnFile pgn_) {
		pgn = pgn_;
		index = 0;
		setFullScreenMode(true);
		loading = true;
	}

	protected void paint(Graphics g) {
		if (loading) {
			// Wait 1 second for resizing
			width = getWidth();
			height = getHeight();
			for (int i = 0; i < 10; i ++) {
				if (width != normalWidth || height != normalHeight) {
					break;
				}
				try {
					Thread.sleep(100);
				} catch (Exception e) {
					// Ignored
				}
				width = getWidth();
				height = getHeight();
			}
			if (!init) {
				init = true;
				// "width" and "height" are Full-Screen values
				String imagePath = "/images/";
				squareSize = Math.min(width / 9, height / 10);
				if (false) {
					// Code Style
				} else if (squareSize >= 36) {
					squareSize = 36;
					imagePath += "large/";
				} else if (squareSize >= 26) {
					squareSize = 26;
					imagePath += "medium/";
				} else if (squareSize >= 18) {
					squareSize = 18;
					imagePath += "small/";
				} else {
					squareSize = 13;
					imagePath += "tiny/";
				}
				int boardWidth = squareSize * 9;
				int boardHeight = squareSize * 10;
				try {
					imgBoard = Image.createImage(imagePath + "board.png");
					for (int pc = 0; pc < 24; pc ++) {
						if (IMAGE_NAME[pc] == null) {
							imgPieces[pc] = null;
						} else {
							imgPieces[pc] = Image.createImage(imagePath + IMAGE_NAME[pc] + ".png");
						}
					}
				} catch (Exception e) {
					throw new RuntimeException(e.getMessage());
				}
				left = (width - boardWidth) / 2;
				top = (height - boardHeight) / 2;
			}
			loading = false;
		}
		for (int x = 0; x < width; x += widthBackground) {
			for (int y = 0; y < height; y += heightBackground) {
				g.drawImage(imgBackground, x, y, Graphics.LEFT + Graphics.TOP);
			}
		}
		g.drawImage(imgBoard, width / 2, height / 2, Graphics.HCENTER + Graphics.VCENTER);
		for (int sq = 0; sq < 256; sq ++) {
			if (SimplePos.IN_BOARD(sq)) {
				int pc = pgn.squares(index)[sq];
				if (pc > 0) {
					drawSquare(g, imgPieces[pc], sq);
				}
			}
		}
		g.setFont(fontSmall);
		g.setColor(index > 0 ? 0x0000ff : 0x808080);
		g.drawString("4 - 上一步", 0, 0, Graphics.LEFT + Graphics.TOP);
		g.setColor(pgn.comment(index).length() > 0 ? 0x0000ff : 0x808080);
		g.drawString("5 - 读注释", width / 2, 0, Graphics.HCENTER + Graphics.TOP);
		g.setColor(index < pgn.maxMoves ? 0x0000ff : 0x808080);
		g.drawString("6 - 下一步", width, 0, Graphics.RIGHT + Graphics.TOP);
		g.setColor(0x0000ff);
		g.drawString("* - 退出", 0, height, Graphics.LEFT + Graphics.BASELINE);
		g.drawString(index + " / " + pgn.maxMoves, width / 2, height,
				Graphics.HCENTER + Graphics.BASELINE);
		g.drawString("# - 关于", width, height, Graphics.RIGHT + Graphics.BASELINE);
	}

	protected void keyPressed(int code) {
		int action = getGameAction(code);
		if (false) {
			// Code Style
		} else if (action == LEFT || action == UP || code == KEY_NUM4) {
			prev();
		} else if (action == FIRE || code == KEY_NUM5) {
			comment();
		} else if (action == RIGHT || action == DOWN || code == KEY_NUM6) {
			next();
		} else if (code == KEY_STAR) {
			back();
		} else if (code == KEY_POUND) {
			about();
		}
	}

	protected void pointerPressed(int x, int y) {
		if (y < fontSmall.getHeight()) {
			switch (x * 3 / width) {
			case 0:
				prev();
				return;
			case 1:
				comment();
				return;
			case 2:
				next();
				return;
			}
		}
		if (height - y < fontSmall.getHeight()) {
			switch (x * 3 / width) {
			case 0:
				back();
				return;
			case 2:
				about();
				return;
			}
		}
	}

	private void drawSquare(Graphics g, Image image, int sq) {
		int sqX = left + (SimplePos.FILE_X(sq) - SimplePos.FILE_LEFT) * squareSize;
		int sqY = top + (SimplePos.RANK_Y(sq) - SimplePos.RANK_TOP) * squareSize;
		g.drawImage(image, sqX, sqY, Graphics.LEFT + Graphics.TOP);
	}

	private void prev() {
		if (index > 0) {
			index --;
			repaint();
			serviceRepaints();
		}
	}

	private void comment() {
		Alert alt = new Alert(index + " / " + pgn.maxMoves,
				pgn.comment(index), null, AlertType.INFO);
		alt.setTimeout(Alert.FOREVER);
		Display.getDisplay(midlet).setCurrent(alt);
		loading = true;
		setFullScreenMode(true);
	}

	private void next() {
		if (index < pgn.maxMoves) {
			index ++;
			repaint();
			serviceRepaints();
		}
	}

	private void back() {
		new Thread() {
			public void run() {
				midlet.listDir();
			}
		}.start();
	}

	private void about() {
		Display.getDisplay(midlet).setCurrent(altAbout);
		loading = true;
		setFullScreenMode(true);
	}
}