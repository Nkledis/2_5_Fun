# Programming 101
#  - Nick Kledis
#
# cerner_2^5_2019
#############################################
function main {
$buildArray = ( "alpha","beta","theta","build","deploy")
$totalSteps = $buildArray.Count
$step = 1
$id = 1
foreach ($build in $buildArray){
    Write-Progress -ID $id -Activity "Overall Progress" -Status $build  -PercentComplete ($step / $totalSteps * 100)
    myFunkyFunction $build
    $step++
}
Write-Progress -ID $ID -Activity "Overall Progress" -Completed
}
function myFunkyFunction{
    param(
    $build
    )
    $thisStep = 1
    while ($thisStep -lt 12) {
        $activity = get-Jargon
        Write-Progress -ID ($id+1) -Activity "Working on $build" -CurrentOperation $activity -PercentComplete ($thisStep / 12 * 100) -ParentId $id
        start-sleep -seconds 5 
        $thisStep ++
    }
}
function get-Jargon {
    $urlStuff = Invoke-WebRequest -uri "https://www.apptic.me/projects/jargon/#!" 
    $jargon = $urlStuff.AllElements | Where id -eq "phraseBox" | Select -First 1 -ExpandProperty innerText
    $jargon
    }
main