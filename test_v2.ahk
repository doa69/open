#SingleInstance Force
SendMode "Input"

; Burst fire configuration
global burstCount := 3      ; Number of presses in each burst (3-tap)
global burstDelay := 30     ; Delay between key presses within a burst (milliseconds)
global burstInterval := 100 ; Delay between bursts (milliseconds)
global isActive := false    ; Track if burst mode is currently active

; Hold left mouse button (M1) to activate burst fire
~LButton::
{
    if (isActive)
        return
    
    isActive := true
    
    ; Continue burst firing while left mouse button is held down
    while GetKeyState("LButton", "P") {
        ; Perform the burst (3-tap of K)
        Loop burstCount {
            Send "k"
            Sleep burstDelay
        }
        
        ; Wait before next burst
        Sleep burstInterval
    }
    
    isActive := false
}
