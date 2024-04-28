# Stretch

Stretch the size of the panel up and down, and the primary & secondary sidebars left and right, to increase and decrease the size of these areas using keyboard shortcuts.

The keyboard shortcuts are based on IntelliJ's shortcuts for resizing tool windows.

## Keybindings

When focus is in the **bottom panel**,

- <kbd><kbd>⌃ctrl</kbd>+<kbd>⌥alt</kbd>+<kbd>⇧shift</kbd>+<kbd>↑up</kbd></kbd> expands the panel larger, and
- <kbd><kbd>⌃ctrl</kbd>+<kbd>⌥alt</kbd>+<kbd>⇧shift</kbd>+<kbd>↓down</kbd></kbd> shrinks the panel smaller.

When focus is in the **primary sidebar**,

- <kbd><kbd>⌃ctrl</kbd>+<kbd>⌥alt</kbd>+<kbd>⇧shift</kbd>+<kbd>→right</kbd></kbd> expands the panel larger, and
- <kbd><kbd>⌃ctrl</kbd>+<kbd>⌥alt</kbd>+<kbd>⇧shift</kbd>+<kbd>←left</kbd></kbd> shrinks the panel smaller

except when the primary sidebar is on the right, as determined by the configuration `workbench.sideBar.location == 'right'`, then the <kbd>←left</kbd> and <kbd>→right</kbd> keys are swapped.

When focus is in the **secondary sidebar**,

- <kbd><kbd>⌃ctrl</kbd>+<kbd>⌥alt</kbd>+<kbd>⇧shift</kbd>+<kbd>←left</kbd></kbd> expands the panel larger, and
- <kbd><kbd>⌃ctrl</kbd>+<kbd>⌥alt</kbd>+<kbd>⇧shift</kbd>+<kbd>→right</kbd></kbd> shrinks the panel smaller

except when the primary sidebar is on the right as above, as that would mean the secondary sidebar is on the left, so <kbd>←left</kbd> and <kbd>→right</kbd> keys are swapped.
