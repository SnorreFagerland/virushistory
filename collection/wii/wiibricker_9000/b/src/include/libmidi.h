#ifndef LIBMIDI_H
#define LIBMIDI_H

// LibMIDI.h - (c)2024 Dakota Thorpe (Dakotath).
// A simple Wii Midi Player library based on libWildMidi.
#include <stdio.h>

int libmidi_init(const char* cfgPath, int sampleRate);
int libmidi_play();
int libmidi_stop();
int libmidi_renderMidi(const char* midiPath, bool verbose);

#endif