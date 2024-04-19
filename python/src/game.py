from curses import wrapper
from time import sleep

row_loc = col_loc = 0

def main(stdscr):

    stdscr.clear()

    while True:
        stdscr.addstr(row_loc, col_loc, 'x')
        stdscr.refresh()
        key_pressed = stdscr.getkey()
        if key_pressed == 'q':
            break
        elif move(stdscr, key_pressed):
            continue
        else:
            shoot(stdscr, key_pressed)

def move(stdscr, key_pressed):
    moved = True
    global row_loc, col_loc
    if key_pressed == 'j':
        stdscr.addstr(row_loc, col_loc, ' ')
        stdscr.refresh()
        row_loc += 1
    elif key_pressed == 'k':
        stdscr.addstr(row_loc, col_loc, ' ')
        stdscr.refresh()
        row_loc -= 1
    elif key_pressed == 'l':
        stdscr.addstr(row_loc, col_loc, ' ')
        stdscr.refresh()
        col_loc += 1
    elif key_pressed == 'h':
        stdscr.addstr(row_loc, col_loc, ' ')
        stdscr.refresh()
        col_loc -= 1
    else:
        moved = False
    return moved

def shoot(stdscr, key_pressed):
    global row_loc, col_loc
    if key_pressed == 'J':
        for row in range(1,11):
            pew(stdscr, row_loc + row, col_loc)
    elif key_pressed == 'K':
        for row in range(1,11):
            pew(stdscr, row_loc - row, col_loc)
    elif key_pressed == 'L':
        for col in range(1,11):
            pew(stdscr, row_loc, col_loc + col)
    elif key_pressed == 'H':
        for col in range(1,11):
            pew(stdscr, row_loc, col_loc - col)

def pew(stdscr, row, col):
    DELAY = 0.01
    stdscr.addstr(row, col, '-')
    stdscr.refresh()
    sleep(DELAY)
    stdscr.addstr(row, col, ' ')
    stdscr.refresh()
    sleep(DELAY)

wrapper(main)

