" Vim syntax file
" Language:     Kawasaki AS
" Maintainer:   Zucchelli Maurizio
" Last Change:  May 06, 2014
" Version:      1

if exists("b:current_syntax")
  finish
endif

setlocal iskeyword+=.
syn case ignore 

syn keyword asTodo contained TODO FIXME XXX NOTE
syn match asComment ";.*$" contains=asTodo

syn keyword asSuper .ROBOTDATA1 .OPE_INFO1 .SYSDATA .AUXDATA .INTER_PANEL_D .INTER_PANEL_COLOR_D .SIG_COMMENT .REALS .JOINTS .TRANS .STRINGS .END
syn keyword asWords1 ABOVE ACCEL ACCURACY ALIGN BELOW BRAKE BREAK BSPEED CALLAUX CLOSE CLOSEI CLOSES C1MOVE C2MOVE CP DECEL DELAY DELETE DRAW DRIVE DWRIST GUNOFF GUNOFFTIMER GUNON GUNONTIMER HMOVE HOME JAPPRO JDEPART JMOVE LAPPRO LDEPART LEFTY LMOVE OPEN OPENI OPENS RELAX RELAXI RELAXS RIGHTY SPEED STABLE TDRAW UWRIST WAIT XMOVERESET SIGNAL PULSE DLYSIG RUNMASK BITS BITS32 SWAIT EXTCALL ONI IGNORE SCNT SCNTRESET SFLK SFLP SOUT STIM SETPICK SETPLACE CLAMP HSENSESET HSENSE PRINT TYPE PROMPT IFPWPRINT IFPLABEL IFPTITLE SETOUTDA OUTDA
syn keyword asWords2 CALL SCALL GOTO CASE VALUE OF IF ELSE WHILE UNTIL FOR TO STEP RETURN RETURNE TWAIT MVWAIT LOCK PAUSE HALT STOP ONE SCASE SVALUE ANY END
syn keyword asWords3 HERE #HERE POINT DECOMPOSE BASE TOOL SET_TOOLSHAPE ENA_TOOLSHAPE TOOLSHAPE SETHOME SETHOME2 LLIMIT ULIMIT TIMER ON OFF NCHON NCHOFF WEIGHT MC TPLIGHT TRACE NLOAD SLOAD SIG TIMER DISTANCE DEXT ASC LEN VAL MAXVAL MINVAL INSTR INT MAXINDEX MININDEX SWITCH WHICHTASK TASK ERROR PRIORITY UTIMER MSPEED MSPEED2 INRANGE SYSDATA EXISTJOINT EXISTTRANS EXISTREAL EXISTCHAR EXITINTEGER EXISTPGM STRTOPOS STRTOVAL ABS SIN COS SQRT PI ATAN2 RANDOM DX DY DZ DEST #DEST FRAME NULL TRANS RX RY RZ #PPOINT SHIFT AVE_TRANS TRADD TRSUB #HOME CCENTER CSHIFT $CHR $SPACE $LEFT $RIGHT $MID $DECODE $ENCODE $ERRORS $ERROR $DATE $TIME PCABORT PCEND PCEXECUTE PCSCAN
syn keyword asBool TRUE FALSE

syn match asOperator /\<["$%&()*,/[]+<=>]/
syn match asString "\".\{-}\""
syn match asNumber "\<[0-9]\+"
syn match asFloat "\<[0-9]\+\.[0-9]\+"

syn region asSuperBlock     matchgroup=asSuper start="\<\%(\.program\)\>" end="\<\.end\>"               contains=ALL fold
syn region asDoBlock        matchgroup=asWords2 start="\<\%(do\|then\)\>" end="\<end\>"                 contains=ALL fold
syn region asLoopDoBlock        matchgroup=asWords2 start="\<do\>" end="\<until\|while\>\(\(do\)\@!.\)*$" contains=ALL fold

hi def link asTodo          Todo
hi def link asComment       Comment
hi def link asSuper         Define
hi def link asWords1        Label
hi def link asWords2        Conditional
hi def link asWords3        Function

hi def link asOperator      Operator
hi def link asBool          Boolean
hi def link asString        String
hi def link asNumber        Number
hi def link asFloat         Float

let b:current_syntax = "as"
