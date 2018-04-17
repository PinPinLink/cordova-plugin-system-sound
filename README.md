# cordova-plugin-system-sound

Cordova iOS play customized system sound.

## Installation

In your root Cordova project

```
cordova plugin add @pinpin.link/cordova-plugin-system-sound
```

## Example

```
/* Play sound */
window.SystemSound.play('www/sound/your-sound-file.mp3');

/* Play sound loop 3 times */
window.SystemSound.play('www/sound/your-sound-file.mp3', 3);
```

## License

This project is licensed under the Apache 2.0 License - see the <LICENSE> file for details
