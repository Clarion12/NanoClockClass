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


    Member
        
    include('ClarionStudio_ClockClass_INC.clw'), once
                    Map

          Include('i64.inc')
          include('ClarionStudio_Prototypes_WinApi32.clw')!,once
        end

!---------------------------------------------------------------
ClockClass.Construct              Procedure()

    CODE
        
        
   Self.DecNanosInOneHour                 = 3600000000000
   Self.DecNanosInOneMinute               = 60000000000
   Self.DecNanosInOneSecond               = 1000000000
   Self.DecNanosInOneMMSec                = 1000000

   i64FromDecimal(Self.i64NanosInOneHour,Self.DecNanosInOneHour)
   i64FromDecimal(Self.i64NanosInOneMinute,Self.DecNanosInOneMinute)
   i64FromDecimal(Self.i64NanosInOneSecond,Self.DecNanosInOneSecond)
   i64FromDecimal(Self.i64NanosInOneMMSec,Self.DecNanosInOneMMSec)


        
!---------------------------------------------------------------
! ClockClass.Start       Procedure()

!     code

!---------------------------------------------------------------
ClockClass.Destruct       Procedure()

    code
        
    !Self.DisposeObjects()
        

    !---------------------------------------------------------------------------------------------------------------------------
ClockClass.CalcSysTimeout              FUNCTION(long _hr,long _min,long _sec,long _mm)

CODE

   Self.LAddHours       = _hr
   Self.LAddMinutes     = _min
   Self.LAddSeconds     = _sec
   Self.LAddMM          = _mm
   
   ! FileSystem
   !Contains a 64-bit value representing the number of 100-nanosecond intervals since January 1, 1601 (UTC).
   
   Self.LDecZero = 0
   i64FromDecimal(Self.Li64NanoToAdd,Self.LDecZero)
   
   GetSystemTimePreciseAsFileTime(Address(Self.LSystemTimeAsFileTimeUINT64))
  
   i64FromDecimal(Self.Li64Hours,Self.LAddHours)
   i64FromDecimal(Self.Li64Minutes,Self.LAddMinutes)
   i64FromDecimal(Self.Li64Seconds,Self.LAddSeconds)
   i64FromDecimal(Self.Li64MM,Self.LAddMM)

   i64Mult(self.Li64Hours,Self.i64NanosInOneHour,Self.Li64HoursInNanoUnits)
   i64Mult(self.Li64Minutes,Self.i64NanosInOneMinute,Self.Li64MinutesInNanoUnits)
   i64Mult(self.Li64Seconds,Self.i64NanosInOneSecond,Self.Li64SecondsInNanoUnits)
   i64Mult(self.Li64MM,Self.i64NanosInOneMMSec,Self.Li64MMInNanoUnits)
   
   i64Add(Self.Li64NanoToAdd,Self.Li64HoursInNanoUnits)
   i64Add(Self.Li64NanoToAdd,Self.Li64MinutesInNanoUnits)
   i64Add(Self.Li64NanoToAdd,Self.Li64SecondsInNanoUnits)
   i64Add(Self.Li64NanoToAdd,Self.Li64MMInNanoUnits)

   Self.LDecVal100 = 100
   i64FromDecimal(Self.Li64Val100,Self.LDecVal100)    
   i64Div(Self.Li64NanoToAdd,Self.Li64Val100,Self.Li64NanoToAdd)
   i64Add(Self.LSystemTimeAsFileTimeUINT64,Self.Li64NanoToAdd)
   i64ToDecimal(Self.LCalcDec,Self.LSystemTimeAsFileTimeUINT64)

    Return Self.LCalcDec


!---------------------------------------------------------------------------------------------------------------------------
ClockClass.GetSysTime                      FUNCTION

  CODE

   GetSystemTimePreciseAsFileTime(Address(Self.LDummyUINT64))
   i64ToDecimal(Self.LDec, Self.LDummyUINT64)    
    Return Self.LDec


!---------------------------------------------------------------------------------------------------------------------------
ClockClass.CreateInterval                      FUNCTION(long EventSetHandle, long _hr,long _min,long _sec,long _mm)

  
  CODE

        !CreateThread(0, 010000h, Address(Self.IntervalThread),0, 0,0)
        return 0
        
!---------------------------------------------------------------------------------------------------------------------------
ClockClass.StartInterval                      FUNCTION

  CODE


!---------------------------------------------------------------------------------------------------------------------------
ClockClass.StopInterval                      FUNCTION

  CODE


!---------------------------------------------------------------------------------------------------------------------------
ClockClass.DeleteInterval                      FUNCTION

  CODE



ClockClass.IntervalThread          PROCEDURE(LONG _threadParamA,LONG _threadParamB)


  CODE

  AttachThreadToClarion(1) ! TODO

!  Loop
!      SleepEx(100,0)
!  End


! CreateThread(0, 010000h, Address(CopyFilesToInstallFolderThread),0, 0,0)
! CreateInterval            procedure(long eventSetAddress,long _hr,long _min,long _sec,long _mm),long



