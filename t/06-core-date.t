use v6.c;
use Test;
use Date::Calendar::Strftime;

my @tests = (   ("%3z whatever %-4z"   , "%3z whatever %-4z"       )
              , ("%A whatever %B"      , "%A whatever %B" )
              , ("%% whatever %B"      , "% whatever %B"      )
              , ("%%%A whatever %B"    , "%%A whatever %B")
              , ("%a %b %d %e %f %j %m", "%a %b 01  1  1 001 01")
              , ("%F %G %L %Y %V %u"   , "2001-01-01 2001 2001 2001 01 1")
              , ("|%2a| |%-2a| |%02a| |%-02a|", "|%2a| |%-2a| |%02a| |%-02a|")
              , ("|%3a| |%-3a| |%03a| |%-03a|", "|%3a| |%-3a| |%03a| |%-03a|")
              , ("|%4a| |%-4a| |%04a| |%-04a|", "|%4a| |%-4a| |%04a| |%-04a|")
              , ("|%5a| |%-5a| |%05a| |%-05a|", "|%5a| |%-5a| |%05a| |%-05a|")
              , ("|%5u| |%-5u| |%05u| |%-05u|", "|    1| |1    | |00001| |1    |")
            );
plan @tests.elems;
my Date $d .= new(2001, 1, 1);
$d does Date::Calendar::Strftime;
for @tests -> $elem {
  my ($fmt, $expected) = @$elem;
  is($d.strftime($fmt), $expected);
}

done-testing;
