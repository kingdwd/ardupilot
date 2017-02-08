#git submodule init && git submodule update
export TOOLCHAIN

ROOT=`cd ../../..; pwd`

export PATH=/usr/local/bin:$PATH

echo $ROOT


(
 cd $ROOT/ArduCopter
 make revomini-clean
 make revomini VERBOSE=1 BOARD=revomini_MP32V1F4 && (

 cp $ROOT/ArduCopter/revomini_MP32V1F4.bin $ROOT/Release/Copter
 cp $ROOT/ArduCopter/revomini_MP32V1F4.hex $ROOT/Release/Copter
 )
) && (
 cd $ROOT/ArduPlane
 make revomini-clean
 make revomini VERBOSE=1 BOARD=revomini_MP32V1F4 && (

 cp $ROOT/ArduPlane/revomini_MP32V1F4.bin $ROOT/Release/Plane
 cp $ROOT/ArduPlane/revomini_MP32V1F4.hex $ROOT/Release/Plane
 )
) && (
 cd $ROOT/ArduCopter
 make revomini-clean
 make revomini VERBOSE=1 BOARD=revomini_Airbot  && (

 cp $ROOT/ArduCopter/revomini_Airbot.bin $ROOT/Release/Copter
 cp $ROOT/ArduCopter/revomini_Airbot.hex $ROOT/Release/Copter
 )
) && (
 cd $ROOT/ArduPlane
 make revomini-clean
 make revomini VERBOSE=1 BOARD=revomini_Airbot && (

 cp $ROOT/ArduPlane/revomini_Airbot.bin $ROOT/Release/Plane
 cp $ROOT/ArduPlane/revomini_Airbot.hex $ROOT/Release/Plane
 )
) && (
 cd $ROOT

 zip -r latest.zip Release
 git add . -A
)
# at 4e017bf5b3da4f2a9ffc2e1cc0a37b94edac2bdc
