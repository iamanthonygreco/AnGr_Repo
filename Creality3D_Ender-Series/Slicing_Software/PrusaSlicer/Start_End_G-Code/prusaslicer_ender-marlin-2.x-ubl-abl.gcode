;
; Custom Start G-Code Version 1.0
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
; Created by: Anthony Greco (@iamanthonygreco, https://www.instagram.com/iamanthonygreco/)
; Date Modified: 2022/05/20 (May 20, 2022)
; Date Created: 2022/05/19 (May 19, 2022)
;
; Slicing Software: PrusaSlicer (Version 2.4.2) based on Slic3r
; 
; Compatible 3D Printer(s):
;   * Creality3D Ender-2 Pro
;   * Creality3D Ender-3, Creality3D Ender-3 Pro, Creality3D Ender-3 Max, Creality3D Ender-3 V2, Creality3D Ender-3 S1
;   * Creality3D Ender-5, Creality3D Ender-5 Pro, Creality3D Ender-5 Plus
; 3D Printer Firmware: Marlin 2.x Firmware (Unified Bed Leveling, Auto Bed Leveling Sensor)

; Set Modes
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
G21 ; set units to millimeters
G90 ; set all axes to absolute positioning
M83 ; set extruder to relative positioning

; Bed Temperature (100%)
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
M140 S{first_layer_bed_temperature[0]} ; set the bed to the first layer bed temperature
M190 S{first_layer_bed_temperature[0]} ; wait for the first layer bed temperature to stabilize

; Nozzle Temperature (50%)
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
M104 S{first_layer_temperature[0] * 0.50} ; set the first layer nozzle tempurature to fifty percent (50%/0.50)

; Bed Leveling (Unified Bed Leveling System)
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
G28 ; home all the axes
G29 A ; enable unified bed leveling
G29 L0 ; load the mesh stored in slot 0 (G29 S0)
G29 J2 ; probe a grid x squared times to calculate a plane and adjust the existing mesh from slot 0 to the current bed tilt, if no values is specified, probe 3 points to find the plane of the bed

; Park Nozzle
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
G1 Z50 F240 ; move to 50 mm on the z-axis at a feedrate (mm/min) of 240
G1 X0.1 Y0.1 F3000 ; move to 0.1 mm on the x-axis and 0.1 mm on the y-axis at a feedrate (mm/min) of 3000

; Nozzle Temperature (100%)
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
M104 S{first_layer_temperature[0]} ; set the nozzle to the first layer nozzle temperature
M109 S{first_layer_temperature[0]} ; wait for the first layer nozzle temperature to stabilize

; Nozzle Purge
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
G1 Z{first_layer_height} F240 ; move to the first layer height on the z-axis at a feedrate (mm/min) of 240
G92 E0 ; set the current position of the extruder to 0
G1 X0.1 Y180.1 Z{first_layer_height} E15 F1500 ; move to 180.1 mm on the y-axis while extruding 15 mm of filament at a feedrate (mm/min) of 1500
G1 X0.4 Y180.1 Z{first_layer_height} F5000 ; move to 0.4 on the x-axis at a feedrate (mm/min) of 5000
G92 E0 ; set the current position of the extruder to 0
G1 X0.4 Y0.1 Z{first_layer_height} E15 F1500 ; move to 0.1 mm on the y-axis while extruding 15 mm of filament at a feedrate (mm/min) of 1500
G92 E0 ; set the current position of the extruder to 0
G1 Z{first_layer_height * 2} F3000 ; move to the first layer height on the z-axis multiplied by 2 at a feedrate (mm/min) of 3000
G1 X5 Y0.1 Z{first_layer_height} F5000.0 ; move the x-axis to 5 mm and the first layer height on the z-axis at a feedrate (mm/min) of 5000 to prevent blob squish
;

;
; Custom End G-Code Version 1.0
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
; Created by: Anthony Greco (@iamanthonygreco, https://www.instagram.com/iamanthonygreco/)
; Date Modified: 2022/05/20 (May 20, 2022)
; Date Created: 2022/05/19 (May 19, 2022)
; 
; Slicing Software: PrusaSlicer (Version 2.4.2) based on Slic3r
; 
; Compatible 3D Printer(s):
;   * Creality3D Ender-2 Pro
;   * Creality3D Ender-3, Creality3D Ender-3 Pro, Creality3D Ender-3 Max, Creality3D Ender-3 V2, Creality3D Ender-3 S1
;   * Creality3D Ender-5, Creality3D Ender-5 Pro, Creality3D Ender-5 Plus
; 3D Printer Firmware: Marlin 2.x Firmware (Unified Bed Leveling, Auto Bed Leveling Sensor)

; Finish Moves
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
G4 ; wait for moves to finish before running the end gcode
G91 ; set all axes to relative positioning

; Reset Print Factor Override Percentages
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
M220 S100 ; set the speed factor override percentage to 100%
M221 S100 ; set the flow rate factor override percentage to 100%

; Retraction
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
G1 E-3 Z{layer_height} F2800 ; retract 3 mm of filament and move z-axis up one layer at a feedrate (mm/min) of 2800 to prevent the nozzle from oozing
G1 X5 Y5 F3000 ; move the x-axis and y-axis 5 mm at a feedrate (mm/min) of 3000 to wipe the nozzle

G90 ; set all axes to absolute positioning

; Park Nozzle
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

; if the maximum layer z (height) of the object is less than the maximum print height (Z_MAX_POS)
; move the z-axis to the z-offset plus whichever value is the smallest between: the maxiumum layer z (height) of the object plus two and the maxiumum print height (Z_MAX_POS)
; at a feedrate (min/mm) of 480
{if max_layer_z < max_print_height}
G1 Z{z_offset + min(max_layer_z + 2, max_print_height)} F480
{endif}

; move the x-axis to 0.1 mm and the y-axis to the maxiumum print depth (Y_BED_SIZE)
; multiplied by eighty percent (80%/0.80) at a feedrate (mm/min) of the travel speed mutlipied by 60
G1 X0.1 Y{print_bed_max[1] * 0.80} F{travel_speed * 60}

; if the maximum layer z (height) of the object is less than the maximum print height (Z_MAX_POS) minus 10
; move the z-axis to the z-offset plus whichever value is the smallest between: the maxiumum layer z (height) of the object plus 70 and the maxiumum print height (Z_MAX_POS) minus 10
; at a feedrate (min/mm) of 480
{if max_layer_z < max_print_height - 10}
G1 Z{z_offset + min(max_layer_z + 70, max_print_height - 10)} F480
{endif}

; if the maximum layer z (height) of the object is less than the maximum print height (Z_MAX_POS) multiplied by 60% (0.60)
; move the z-axis to the maximum print height (Z_MAX_POS) multiplied by 60% (0.60)
; at a feedrate (min/mm) of 480
{if max_layer_z < max_print_height * 0.60}
G1 Z{max_print_height * 0.6} F480
{endif}

; Cooldown
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
M140 S0 ; set the bed temperature to 0 °C
M104 S0 ; set the nozzle temperature to 0 °C
M107 ; turn off the print cooling fan

; Disable Stepper Motors
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
M84 X Y E ; disable the x-axis, y-axis, and extruder stepper motors
;