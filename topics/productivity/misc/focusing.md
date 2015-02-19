# Hacks for focusing and tuning out distractions

## Brownian noise

Requires sox. Plays an hour of [brownian noise](http://en.wikipedia.org/wiki/Brownian_noise), which is more of a dull roar than white noise. It's good at muffling typical conversational speech, but allowing you to hear someone trying to get your attention.

    #!/bin/sh

    play -n synth 60:00 brownnoise
