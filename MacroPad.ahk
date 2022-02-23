#Include %A_ScriptDir%
#Include Spotify.ahk
global VolumePercentage
global ShuffleMode
global RepeatMode := 0
spoofy := new Spotify
VolumePercentage := spoofy.Player.GetCurrentPlaybackInfo().Device.Volume ? spoofy.Player.GetCurrentPlaybackInfo().Device.Volume : 0
;SetTimer, forceReload, -1800000    ;Reloads the script after 30 min in ms
return

F14::spoofy.Player.LastTrack() ; Prev Track

F15::spoofy.Player.PlayPause() ; PlayPause

F16::spoofy.Player.NextTrack() ; Next Track

F17::
if(VolumePercentage - 10 > 0)
  VolumePercentage:=VolumePercentage-10
spoofy.Player.SetVolume(VolumePercentage) ; Decrement the volume percentage and set the player to the new volume percentage
return

F18::
VolumePercentage:=VolumePercentage+10
if(VolumePercentage > 100){
  VolumePercentage:=100
}
spoofy.Player.SetVolume(VolumePercentage) ; Increment the volume percentage and set the player to the new volume percentage
return 

;forceReload:  ;This is the label that the setTimer is calling
;Reload
;return