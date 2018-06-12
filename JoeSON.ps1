$url = 'http://letsrevolutionizetesting.com/challenge.json'

$response = Invoke-WebRequest -Uri $url

while ($response.Content -like "*follow*")
{
    $urlid = (ConvertFrom-Json -InputObject $response.Content).follow.Split("=")[1]
    $url = "http://letsrevolutionizetesting.com/challenge.json?id=" + $urlid
    $response = Invoke-WebRequest -Uri $url
}

$response.Content