$config = bcdedit /enum | Where-Object { $_.StartsWith("hypervisorlaunchtype")}
$value = $($config -Split " ")[-1]
if ($value -eq "auto") {
    bcdedit /set hypervisorlaunchtype off
} else {
    bcdedit /set hypervisorlaunchtype auto
}

Restart-Computer