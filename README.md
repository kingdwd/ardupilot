#ArduPilot Project port for Revolution/RevoMini boards#

* near a half of code is fully rewritten
* external I2C bus moved out from FlexiPort by Soft_I2C driver so we always has at least 3 UARTs
* added 1 full-functional UART (only for quads) and 1 RX-only UART for DSM satellite receiver on OpLink connector
* Unlike many other boards, fully implemented registerPeriodicCallback & Co calls
* implemented register_io_process via simple cooperative multitasking
* added buzzer support
* stack now in CCM memory
* PPM and PWM inputs works via Timer's driver handlers
* added DSM and SBUS parsing on PPM input
* high-frequency (8kHz) advanced scheduler, common for all needs, capable to use semaphores with (optional) performance statistics
* all hardware description tables are now 'const' and locates in flash
* more reliable reset for I2C bus on hangups
* all drivers support set_retries()
* all delays - even microseconds - are very presize by using hardware clock counter (DWT_CYCCNT) in free-running mode
* separated USB and UART drivers
* new SoftwareSerial driver based on ST appnote
* now it uses MPU6000 DRDY output
* removed all compiler's warnings
* ported and slightly altered bootloader to support flashing and start firmware automatically at addresses 8010000 and 8020000
  (2 low 16k flash pages are used to emulate EEPROM)           
* EEPROM emulation altered to ensure the reliability of data storage at power failures
* optimized EEPROM usage by changing from 1-byte to 2-byte writes
* all internal calls use static private methods                
* removed unused files from "wirish" folder
* added support for baro MS5611 on external I2C
* micros() call uses 32-bit hardware timer instead of systick_micros()
* ...
* a lot of minor enhancements

Incompatibility!!!

Since this controller is intended primarily for very small aircraft, the following unnecessary functions are disabled by default:
* Terrain following - there is no SD card
* Optical Flow
* ADSB support
* Precision landing
* Push Button
* Relay support
* Rangefinder support
* Sprayer support
* EPM gripper support
* Mount control support
* CLI support

If some of this is needed it can be enabled later

Also, this HAL now is not compatible with LibMapple/ArduinoSTM32 ("wirish" folder) - all imported files are altered.

Warning!!!
EEPROM emulation in Flash cause periodic program hunging on time of sector erase! So never allow auto-save parameters like MOT_THST_HOVER - MOT_HOVER_LEARN should NOT be 2!

If you like this project and want to support further development - you can do it! [![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](htt
ps://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=SLUC8B3U7E7PS)USD
  [![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=HXRA6EXZJ489C)
 EUR

[Russian thread](http://www.ykoctpa.ru/groups/eye-in-a-sky/forum/topic/ardupilot-na-platax-openpilot-revolution-revomini/)

***********************************************

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/ArduPilot/ardupilot?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Build SemaphoreCI](https://semaphoreci.com/api/v1/projects/4d28a40d-b6a6-4bfb-9780-95d92aabb178/667563/badge.svg)](https://semaphoreci.com/diydrones/ardupilot)

[![Build Travis](https://travis-ci.org/ArduPilot/ardupilot.svg?branch=master)](https://travis-ci.org/ArduPilot/ardupilot)

[![Coverity Scan Build Status](https://scan.coverity.com/projects/5331/badge.svg)](https://scan.coverity.com/projects/diydrones-ardupilot)

### The ArduPilot project is made up of: ###
>>ArduCopter (or APM:Copter) : [code](https://github.com/ArduPilot/ardupilot/tree/master/ArduCopter), [wiki](http://ardupilot.org/copter/index.html)

>>ArduPlane (or APM:Plane) : [code](https://github.com/ArduPilot/ardupilot/tree/master/ArduPlane), [wiki](http://ardupilot.org/plane/index.html)

>>ArduRover (or APMrover2) : [code](https://github.com/ArduPilot/ardupilot/tree/master/APMrover2), [wiki](http://ardupilot.org/rover/index.html)

>>Antenna Tracker : [code](https://github.com/ArduPilot/ardupilot/tree/master/AntennaTracker), [wiki](http://ardupilot.org/antennatracker/index.html)

### User Support & Discussion Forums ###
>>Support Forum: [http://discuss.ardupilot.org/](http://discuss.ardupilot.org/)

>>Community Site: [http://ardupilot.org](http://ardupilot.org)

### Developer Information ###
>>Github repository: [https://github.com/ArduPilot/ardupilot](https://github.com/ArduPilot/ardupilot)

>>Main developer wiki: [http://dev.ardupilot.org](http://dev.ardupilot.org)

>>Developer email group: drones-discuss@googlegroups.com

### Contributors ###
>>[Github statistics](https://github.com/ArduPilot/ardupilot/graphs/contributors)

### How To Get Involved ###
>>The ArduPilot project is open source and we encourage participation and code contributions: [guidelines for contributors to the ardupilot codebase](http://dev.ardupilot.org/wiki/guidelines-for-contributors-to-the-apm-codebase)

>>We have an active group of Beta Testers especially for ArduCopter to help us find bugs: [release procedures](http://dev.ardupilot.org/wiki/release-procedures)

>>Desired Enhancements and Bugs can be posted to the [issues list](https://github.com/ArduPilot/ardupilot/issues).

>>Helping other users with log analysis on [http://discuss.ardupilot.org/](http://discuss.ardupilot.org/) is always appreciated:

>>There is a group of wiki editors as well in case documentation is your thing: ardu-wiki-editors@googlegroups.com

>>Developer discussions occur on drones-discuss@google-groups.com

### License ###
>>[Overview of license](http://dev.ardupilot.com/wiki/license-gplv3)

>>[Full Text](https://github.com/ArduPilot/ardupilot/blob/master/COPYING.txt)

### Maintainers ###
>> Ardupilot is comprised of several parts, vehicles and boards. The list below
>> contains the people that regularly contribute to the project and are responsible
>> for reviewing patches on their specific area. See [CONTRIBUTING.md](.github/CONTRIBUTING.md)
>> for more information.
>>
>> - [Andrew Tridgell](https://github.com/tridge)
>>   - ***Vehicle***: Plane, AntennaTracker
>>   - ***Board***: APM1, APM2, Pixhawk, Pixhawk2, PixRacer
>> - [Randy Mackay](https://github.com/rmackay9)
>>   - ***Vehicle***: Copter, AntennaTracker
>> - [Robert Lefebvre](https://github.com/R-Lefebvre)
>>   - ***Vehicle***: TradHeli
>> - [Grant Morphett](https://github.com/gmorph):
>>   - ***Vehicle***: Rover
>> - [Tom Pittenger] (https://github.com/magicrub)
>>   - ***Vehicle***: Plane
>> - [Paul Riseborough](https://github.com/priseborough)
>>   - ***Subsystem***: AP_NavEKF2
>> - [Lucas De Marchi](https://github.com/lucasdemarchi)
>>   - ***Subsystem***: Linux
>> - [Peter Barker](https://github.com/peterbarker)
>>   - ***Subsystem***: DataFlash
>>   - ***Subsystem***: Tools
>> - [Michael du Breuil](https://github.com/WickedShell)
>>   - ***Subsystem***: uBlox GPS
>> - [Francisco Ferreira](https://github.com/oxinarf)
>>   - ***Bug Master***
>> - [Matthias Badaire](https://github.com/badzz)
>>   - ***Subsystem***: FRSky
>> - [Víctor Mayoral Vilches](https://github.com/vmayoral)
>>   - ***Board***: PXF, Erle-Brain 2, PXFmini
>> - [Mirko Denecke](https://github.com/mirkix)
>>   - ***Board***: BBBmini
>> - [Georgii Staroselskii](https://github.com/staroselskii)
>>   - ***Board***: NavIO
>> - [Emile Castelnuovo](https://github.com/emilecastelnuovo)
>>   - ***Board***: VRBrain
>> - [Julien BERAUD](https://github.com/jberaud)
>>   - ***Board***: Bebop & Bebop 2
>> - [Pritam Ghanghas](https://github.com/pritamghanghas)
>>   - ***Board***: Raspilot
>> - [Jonathan Challinger] (https://github.com/3drobotics/ardupilot-solo)
>>   - ***Vehicle***: 3DRobotics Solo ArduPilot maintainer
>> - [Gustavo José de Sousa](https://github.com/guludo)
>>   - ***Subsystem***: Build system
>> - [Craig Elder] (https://github.com/CraigElder)
>>   - ***Administration***: ArduPilot Technical Community Manager
