function keyBApp
    close,clc
 
    figure
    note = [261.6 293.7 329.6 349.2 392.0 440.0 493.9 523.3];
    noteLetters = ['C' 'D' 'E' 'F' 'G' 'A' 'B' 'C'];
    keys = [];
    for i = 1:1:numel(note)
       a = uicontrol; % adds a button
       % do set stuff
       keys = [keys, a]; % allows indexing of all buttons.
       set(a, 'String', noteLetters(i), 'Position', [20 + (i* 20) 20 20 100],...
       'Callback', {@playKey,note(i)});
    end
end
 
function playKey(o,e,note)
    fs = 8000;
    T = 0.5; % length of sound.
    t = 0:1/fs:T;
    A = (T - t) / T;
    
    ySound = sin(note*2*pi*t);
    sound(ySound,fs) % sound to play, sampling frequency.
end
 