from curses import wrapper
from time import sleep

key_pressed = None

def main(stdscr):
    global key_pressed
    # Clear screen
    stdscr.clear()

    # This raises ZeroDivisionError when i == 10.
    for i in range(0, 10):
        i_less_ten = i-10
        stdscr.addstr(0, 0, '10 divided by {} is {}                  '.format(i_less_ten, 10/i_less_ten))
        stdscr.refresh()
        sleep(0.5)

    stdscr.refresh()
    key_pressed = stdscr.getkey()

wrapper(main)

print(key_pressed)

