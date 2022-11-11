!        The MIT License (MIT)
!        Copyright © 2022 <copyright MENNO DE RUITER / CLARION.STUDIO>
!
!        Permission is hereby granted, free of charge, to any person obtaining a copy of this software
!        and associated documentation files (the “Software”), to deal in the Software without restriction, | 
!        including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, |
!        and/or sell copies of the Software, and to
!        permit persons to whom the Software is furnished to do so, subject to the following conditions:
!
!        The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
!
!        THE SOFTWARE / CODE  PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
!        TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
!        IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
!        WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
!        OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
!
!        WITH LOVE TO THE CLARION COMMUNITY, ROBERT ZAUNERE, DIEGO, BRUCE, ALL THE MARK'S AND ANDY'S, MIKE'S AND MANY MORE.
!        LET'S RESURRECT CLARION :-)


!===================================================================!
ClockClass                    Class(),type, Module('ClarionStudio_ClockClass.clw'), Link('ClarionStudio_ClockClass.clw',1),DLL(0)

SysTime                             Decimal(19,0)

Timeout                             decimal(19,0)
Timeout_Days                        LONG
Timeout_Hours                       LONG
Timeout_Minutes                     LONG
Timeout_Seconds                     LONG
Timeout_MilliSeconds                LONG
Timeout_NanoSeconds                 LONG


DecNanosInOneHour                  decimal(19,0)
DecNanosInOneMinute                decimal(19,0)
DecNanosInOneSecond                decimal(19,0)
DecNanosInOneMMSec                 decimal(19,0)
i64NanosInOneHour                  like(UINT64)
i64NanosInOneMinute                like(UINT64)
i64NanosInOneSecond                like(UINT64)
i64NanosInOneMMSec                 like(UINT64)
LDUMMYUINT64                       like(UINT64)
LSystemTimeUINT64                  like(UINT64)
LSystemTimeAsFileTimeUINT64        like(UINT64)
LFileTimeUINT64                    like(UINT64)
LFileTimeDec                       decimal(19,0)
LDec1                              decimal(19,0)
LDecNanoToAdd                      decimal(19,0)
LReturnString1K                    string(1024)
Li64HoursInNanoUnits               like(UINT64)
Li64MinutesInNanoUnits             like(UINT64)
Li64SecondsInNanoUnits             like(UINT64)
Li64MMInNanoUnits                  like(UINT64)
LDecStart                          decimal(19,0)
LDecEnd                            decimal(19,0)
LDecDiff                           decimal(19,0)
LResult                            long
LDecZero                           decimal(19,0)
Li64NanoLeft                       like(UINT64)
Li64NanoToAdd                      like(UINT64)
Li64Hours                          like(UINT64)
Li64Minutes                        like(UINT64)
Li64Seconds                        like(UINT64)
Li64MM                             like(UINT64)
LAddHours                          decimal(19,0)
LAddMinutes                        decimal(19,0)
LAddSeconds                        decimal(19,0)
LAddMM                             decimal(19,0)
LDecVal10                          decimal(19,0)
Li64Val10                          like(UINT64)
LDecVal100                         decimal(19,0)
Li64Val100                         like(UINT64)
LCalcDec                           decimal(19,0)
AddressLDummyUINT64                long
LDec                               decimal(19)
LSystemTime                        group,pre(LSystemTime)
Year                                   short
Month                                  short
DayOfWeek                              short
Day                                    short
Hour                                   short
Minute                                 short
Second                                 short
Milliseconds                           short
                                   end
Construct                           procedure()
Destruct                            procedure()
CalcSysTimeout                      procedure(long _hr,long _min,long _sec,long _mm),string
GetSysTime                          procedure(),string
CreateInterval                      procedure(long eventSetAddress,long _hr,long _min,long _sec,long _mm),long
StartInterval                       procedure()
StopInterval                        procedure()
DeleteInterval                      procedure()
IntervalThread                      procedure(long _threadParamA, long _threadParamB)
                            End
