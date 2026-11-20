# portal.run

Open a portal between your hands. Your webcam tracks both hands; the thumb and index
fingertip of each hand become the 4 corners of a glowing window, and everything inside it
is rendered through a live effect.

Effects: **ascii** (green matrix code), **comic** (ink outlines + halftone), **thermal**,
**neon** (glowing edges), **pixel**.

## Run it

1. Double-click `start.bat` (starts a small local server and opens http://localhost:8765).
   No Python? Open `index.html` directly in Chrome or Edge.
2. Click **start camera** and allow the camera and mic.
3. Hold up both hands.

Needs an internet connection on first load (the hand-tracking model is fetched from Google's
MediaPipe CDN).

## Gestures

| Do this | What happens |
| --- | --- |
| Thumb + index of both hands | Portal appears between them |
| Snap your fingers | Next effect, rippling out from your fingers |
| Flick your hands apart fast | Effect goes full screen (or tap **full**) |
| Bring your hands back close | Back to the normal portal |

On a phone: prop it up (portrait or landscape both work) and step back so both hands fit
in the frame.

A snap needs the mic to hear the click **and** the camera to see thumb + middle finger
pressed together, so talking or typing won't trigger it.

## Keys

| Key | Action |
| --- | --- |
| `1`-`5` / `←` `→` | Pick effect |
| `Space` | Same as a snap |
| `R` | Record a clip (saved to Downloads, with mic audio) |
| `E` | Lock / unlock full screen |
| `H` | Hide / show the HUD |
| `M` | Mirror on / off |
| `F` | Browser fullscreen |
| `[` / `]` | Snap detection less / more sensitive |

You can also drop a video file onto the page to run it through the portal instead of the camera.

## How it works

- Hand tracking: MediaPipe Hand Landmarker (runs in the browser, GPU when available)
- Corners smoothed with a one-euro filter
- Effects are a single WebGL2 fragment shader, masked to the portal quad
- Snap detection: high-passed mic transient + thumb-middle pinch pose
- Everything is in `index.html`; no build step
