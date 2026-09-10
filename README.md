[README.md](https://github.com/user-attachments/files/31999139/README.md)
# EQ Legends Annoying Sound Remover

This small Windows batch file removes selected sound entries from EQ Legends so the game does not load or play those sounds.

Download it from here: https://github.com/aodgizmo/EverQuest_Legends_SoundModifier/blob/main/RemoveAnnoyingSounds.bat

It currently disables:

| File entry | Sound |
| --- | --- |
| `143^thunder1.wav^` | Loud thunder during rain |
| `144^thunder2.wav^` | Another loud thunder sound during rain |
| `159^rainloop.wav^` | Looping rain sound |
| `4624^dog_atk.wav^` | Dog barking while attacking |
| `355^Wolf_Att.wav^` | Wolf-form barking while attacking |
| `566^wolf_dire_atk.wav^` | Dire wolf attack sound |

## Important: when to run the file

The EQ Legends patcher restores `soundassets.txt` whenever it patches the game. Because of that, the batch file must be run **after clicking PLAY in the patcher but before joining a server**.

The correct order is:

1. Open the EQ Legends patcher.
2. Let it finish patching.
3. Click **PLAY**.
4. Wait until the server-selection screen appears.
5. Run `RemoveAnnoyingSounds.bat`.
6. When it says `Done`, press any key to close the black window.
7. Select your server and enter the game.

You must repeat these steps each time the patcher restores the file.

## Download and install

1. On this GitHub page, click the green **Code** button.
2. Click **Download ZIP**.
3. Open the downloaded ZIP file.
4. Copy `RemoveAnnoyingSounds.bat` into your main EQ Legends folder.
5. Make sure it is in the **same folder** as `soundassets.txt`.

Do not run the batch file from inside the ZIP. Extract or copy it into the game folder first.

Your folder should contain both files:

```text
EQ Legends
  soundassets.txt
  RemoveAnnoyingSounds.bat
```

The exact location of the EQ Legends folder depends on where you installed the game. If you do not know where it is, right-click your EQ Legends shortcut, click **Open file location**, and look for `soundassets.txt`.

## Make it easier to run

You can create a desktop shortcut without moving the batch file:

1. Right-click `RemoveAnnoyingSounds.bat`.
2. On Windows 11, click **Show more options** if necessary.
3. Click **Send to**, then **Desktop (create shortcut)**.
4. Use that shortcut after reaching the server-selection screen.

The real batch file must remain beside `soundassets.txt`.

## How the batch file works

The batch file starts the PowerShell program already included with Windows. PowerShell opens `soundassets.txt`, removes every line listed in `$r`, and saves the file again.

This is the sound-removal list inside the batch file:

```powershell
$r=@('143^thunder1.wav^','144^thunder2.wav^','159^rainloop.wav^','4624^dog_atk.wav^','566^wolf_dire_atk.wav^','355^Wolf_Att.wav^')
```

Each item between quotation marks is one complete line that will be removed from `soundassets.txt`.

## Add another sound to the removal list

First, make a backup copy of `soundassets.txt`. This gives you an easy way to undo mistakes while experimenting.

Then:

1. Find the unwanted sound's complete line in `soundassets.txt`.
2. Copy the entire line exactly, including its number and `^` characters.
3. Right-click `RemoveAnnoyingSounds.bat`.
4. Click **Edit**. On Windows 11, you may need to click **Show more options** first.
5. Find the section beginning with `$r=@(`.
6. Add a comma after the previous item.
7. Put the new complete sound entry between single quotation marks.
8. Save the file.

For example, suppose this is the sound entry you want to remove:

```text
999^example.wav^
```

Change this:

```powershell
$r=@('143^thunder1.wav^','144^thunder2.wav^')
```

Into this:

```powershell
$r=@('143^thunder1.wav^','144^thunder2.wav^','999^example.wav^')
```

Important rules:

- Keep every entry inside single quotation marks: `'entry'`
- Put a comma between entries.
- Do not put a comma after the final entry.
- Copy the complete line from `soundassets.txt`.
- Keep the `^` characters.
- Do not add backslashes before underscores. Use `dog_atk.wav`, not `dog\_atk.wav`.

The removal is based on an exact full-line match. If the number, filename, or punctuation does not match the line in `soundassets.txt`, that sound will not be removed.

## Stop removing a sound

To allow one of the sounds again:

1. Right-click `RemoveAnnoyingSounds.bat` and click **Edit**.
2. Find that sound entry in the `$r=@(...)` list.
3. Delete the complete quoted entry.
4. Also remove the nearby comma so the remaining items still have exactly one comma between them.
5. Save the batch file.
6. Run the EQ Legends patcher again so it restores the original `soundassets.txt`.
7. After clicking **PLAY**, run the edited batch file.

Example before removing an item:

```powershell
$r=@('143^thunder1.wav^','144^thunder2.wav^','159^rainloop.wav^')
```

Example after allowing `rainloop.wav` again:

```powershell
$r=@('143^thunder1.wav^','144^thunder2.wav^')
```

Simply removing an entry from the batch file does not immediately restore it to an already-edited `soundassets.txt`. Letting the patcher restore the original file is what puts the sound entry back.

## Troubleshooting

### The sounds still play

Check these things:

1. The batch file is in the same folder as `soundassets.txt`.
2. You ran it after clicking **PLAY** in the patcher.
3. You ran it before joining the server.
4. Any custom entry exactly matches the complete line in `soundassets.txt`.

### Windows says it cannot find `soundassets.txt`

The batch file is probably in the wrong folder. Move it into the folder containing the game's actual `soundassets.txt` file.

### The filename ends in `.bat.txt`

Windows may hide known file extensions. Open File Explorer, click **View**, then **Show**, and enable **File name extensions**. Rename the file so its full name is:

```text
RemoveAnnoyingSounds.bat
```

### Windows warns about running the file

Batch files can run commands, so Windows may display a warning for files downloaded from the internet. You can right-click the file and select **Edit** to inspect its contents before running it. Only run files you trust.

### I made a mistake while editing

Download a fresh copy of `RemoveAnnoyingSounds.bat` from this repository. Then run the EQ Legends patcher to restore a clean copy of `soundassets.txt` before trying again.

## Notes

- This tool changes only `soundassets.txt`.
- It does not delete any `.wav` sound files.
- The patcher can restore the original entries.
- Game updates may change sound numbers or filenames.
- This project is an unofficial community tool and is not affiliated with the EQ Legends team.
