Describe "option6.sh"
  Specify 'without any parameters'
    When run shell ./option6.sh
    The line 1 of output should eq 'FLAG_A: '
    The line 2 of output should eq 'FLAG_B: '
    The line 3 of output should eq 'ARG_I: '
    The line 4 of output should eq 'ARG_J: '
    The lines of output should eq 4
  End

  Specify 'with parameters'
    When run shell ./option6.sh - 1 2
    The line 1 of output should eq 'FLAG_A: '
    The line 2 of output should eq 'FLAG_B: '
    The line 3 of output should eq 'ARG_I: '
    The line 4 of output should eq 'ARG_J: '
    The line 5 of output should eq '$1: -'
    The line 6 of output should eq '$2: 1'
    The line 7 of output should eq '$3: 2'
    The lines of output should eq 7
  End

  Specify 'unrecognized option'
    When run shell ./option6.sh -x
    The error should eq "unrecognized option '-x'"
    The status should be failure
  End

  Specify 'with short options'
    When run shell ./option6.sh -a -i A -b -j B
    The line 1 of output should eq 'FLAG_A: 1'
    The line 2 of output should eq 'FLAG_B: 1'
    The line 3 of output should eq 'ARG_I: A'
    The line 4 of output should eq 'ARG_J: B'
    The lines of output should eq 4
  End

  Specify 'missing short option argument'
    When run shell ./option6.sh -a -i
    The error should eq "option '-i' requires an argument"
    The status should be failure
  End

  Specify 'with long options'
    When run shell ./option6.sh --flag-a --arg-i I
    The line 1 of output should eq 'FLAG_A: 1'
    The line 2 of output should eq 'FLAG_B: '
    The line 3 of output should eq 'ARG_I: I'
    The line 4 of output should eq 'ARG_J: '
    The lines of output should eq 4
  End

  Specify 'missing long option argument'
    When run shell ./option6.sh --flag-a --arg-i
    The error should eq "option '--arg-i' requires an argument"
    The status should be failure
  End

  Specify 'with paramters'
    When run shell ./option6.sh a b
    The line 1 of output should eq 'FLAG_A: '
    The line 2 of output should eq 'FLAG_B: '
    The line 3 of output should eq 'ARG_I: '
    The line 4 of output should eq 'ARG_J: '
    The line 5 of output should eq '$1: a'
    The line 6 of output should eq '$2: b'
    The lines of output should eq 6
  End

  Specify 'mixed options and parameters'
    When run shell ./option6.sh --flag-a param --arg-i I
    The line 1 of output should eq 'FLAG_A: 1'
    The line 2 of output should eq 'FLAG_B: '
    The line 3 of output should eq 'ARG_I: I'
    The line 4 of output should eq 'ARG_J: '
    The line 5 of output should eq '$1: param'
    The lines of output should eq 5
  End

  Specify 'stop parsing with --'
    When run shell ./option6.sh --flag-a -- param --arg-i I param2
    The line 1 of output should eq 'FLAG_A: 1'
    The line 2 of output should eq 'FLAG_B: '
    The line 3 of output should eq 'ARG_I: '
    The line 4 of output should eq 'ARG_J: '
    The line 5 of output should eq '$1: param'
    The line 6 of output should eq '$2: --arg-i'
    The line 7 of output should eq '$3: I'
    The line 8 of output should eq '$4: param2'
    The lines of output should eq 8
  End

  Specify 'consecutive short options'
    When run shell ./option6.sh -ab
    The line 1 of output should eq 'FLAG_A: 1'
    The line 2 of output should eq 'FLAG_B: 1'
    The line 3 of output should eq 'ARG_I: '
    The line 4 of output should eq 'ARG_J: '
    The lines of output should eq 4
  End

  Specify 'not allow argument'
    When run shell ./option6.sh --flag-a=123
    The error should eq "option '--flag-a' doesn't allow an argument"
    The status should be failure
  End

  Specify 'short option with argument'
    When run shell ./option6.sh -i123 -j=456
    The line 1 of output should eq 'FLAG_A: '
    The line 2 of output should eq 'FLAG_B: '
    The line 3 of output should eq 'ARG_I: 123'
    The line 4 of output should eq 'ARG_J: =456'
    The lines of output should eq 4
  End

  Specify 'long option with argument'
    When run shell ./option6.sh --arg-i=123 --arg-j=456
    The line 1 of output should eq 'FLAG_A: '
    The line 2 of output should eq 'FLAG_B: '
    The line 3 of output should eq 'ARG_I: 123'
    The line 4 of output should eq 'ARG_J: 456'
    The lines of output should eq 4
  End
End
