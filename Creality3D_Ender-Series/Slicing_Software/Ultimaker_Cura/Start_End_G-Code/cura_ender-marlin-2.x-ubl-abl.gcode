;
; Custom Start G-Code Version 1.0
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
; Created by: Anthony Greco (@iamanthonygreco, https://www.instagram.com/iamanthonygreco/)
; Date Modified: 2022/05/20
; Date Created: 2022/05/19
; 
; Slicing Software: Cura (Version 5.0)
; 
; Compatible 3D Printer(s):
;   * Creality3D Ender-2 Pro
;   * Creality3D Ender-3, Creality3D Ender-3 Pro, Creality3D Ender-3 Max, Creality3D Ender-3 V2, Creality3D Ender-3 S1
;   * Creality3D Ender-5, Creality3D Ender-5 Pro, Creality3D Ender-5 Plus
; 3D Printer Firmware: Marlin 2.x (Unified Bed Leveling, Auto Bed Leveling Sensor)

; Set Modes
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
G21 ; set units to millimeters
G90 ; set all axes to absolute positioning
M83 ; set extruder to relative positioning

; Bed Temperature (100%)
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
M140 S{material_bed_temperature_layer_0} ; set the bed to the initial layer bed temperature
M190 S{material_bed_temperature_layer_0} ; wait for the initial layer bed temperature to stabilize

; Nozzle Temperature (50%)
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
M104 S{material_print_temperature_layer_0 * 0.50} ; set the initial layer nozzle tempurature to fifty percent (50%/0.50)

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
M104 S{material_print_temperature_layer_0} ; set the nozzle to the initial layer nozzle temperature
M109 S{material_print_temperature_layer_0} ; wait for the initial layer nozzle temperature to stabilize

; Nozzle Purge
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
G1 Z{layer_height_0} F240 ; move to the initial layer height on the z-axis at a feedrate (mm/min) of 240
G92 E0 ; set the current position of the extruder to 0
G1 X0.1 Y180.1 Z{layer_height_0} E15 F1500 ; move to 180.1 mm on the y-axis while extruding 15 mm of filament at a feedrate (mm/min) of 1500
G1 X0.4 Y180.1 Z{layer_height_0} F5000 ; move to 0.4 on the x-axis at a feedrate (mm/min) of 5000
G92 E0 ; set the current position of the extruder to 0
G1 X0.4 Y0.1 Z{layer_height_0} E15 F1500 ; move to 0.1 mm on the y-axis while extruding 15 mm of filament at a feedrate (mm/min) of 1500
G92 E0 ; set the current position of the extruder to 0
G1 Z{layer_height_0 * 2} F3000 ; move to the first layer height on the z-axis multiplied by 2 at a feedrate (mm/min) of 3000
G1 X5 Y0.1 Z{layer_height_0} F5000.0 ; move the x-axis to 5 mm and the first layer height on the z-axis at a feedrate (mm/min) of 5000 to prevent blob squish
;

;
; Custom End G-Code Version 1.0
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
; Created by: Anthony Greco (@iamanthonygreco, https://www.instagram.com/iamanthonygreco/)
; Date Modified: 2022/05/20
; Date Created: 2022/05/19
; 
; Slicing Software: Cura (Version 5.0)
; 
; Compatible 3D Printer(s):
;   * Creality3D Ender-2 Pro
;   * Creality3D Ender-3, Creality3D Ender-3 Pro, Creality3D Ender-3 Max, Creality3D Ender-3 V2, Creality3D Ender-3 S1
;   * Creality3D Ender-5, Creality3D Ender-5 Pro, Creality3D Ender-5 Plus
; 3D Printer Firmware: Marlin 2.x (Unified Bed Leveling, Auto Bed Leveling Sensor)

; Finish Moves
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
G4 ; wait for moves to finish before running the end gcode
G91 ; set all axes to relative positioning

; Reset Print Factor Override Percentages
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
M220 S100 ; set the speed factor override percentage to 100%
M221 S100 ; set the flow rate factor override percentage to 100%

; Retraction & Wipe
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
G1 E-3 Z{layer_height} F2800 ; retract 3 mm of filament and move z-axis up one layer at a feedrate (mm/min) of 2800 to prevent the nozzle from oozing
G1 X5 Y5 F3000 ; move the x-axis and y-axis 5 mm at a feedrate (mm/min) of 3000 to wipe the nozzle

; Park Nozzle
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
G1 Z2 F480; move the z-axis 2 mm at a feedrate (mm/min) of 480
G90 ; set all axes to absolute positioning

; move the x-axis to 0.1 mm and the y-axis to the maxiumum print depth (Y_BED_SIZE)
; multiplied by eighty percent (80%/0.80) at a feedrate (mm/min) of the travel speed mutlipied by 60
G1 X0.1 Y{machine_depth * 0.80} F{speed_travel * 60}

G91 ; set all axes to relative positioning
G1 Z{machine_height * 0.25} F480 ; move the z-axis to the maximum print height (Z_MAX_POS) multiplied by 25% (0.25)

G90 ; set all axes to absolute positioning

; Cooldown
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
M140 S0 ; set the bed temperature to 0 °C
M104 S0 ; set the nozzle temperature to 0 °C
M107 ; turn off the print cooling fan

; Disable Stepper Motors
; –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––
M84 X Y E ; disable the x-axis, y-axis, and extruder stepper motors
;