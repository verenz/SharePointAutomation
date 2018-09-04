$SiteURL= "https://Sp2016URL" 
$logoPath= "/siteAssets/YourCompanyNewLogo.jpg" 
$site=new-object Microsoft.SharePoint.SPSite($SiteURL) 
foreach($web in $site.Allwebs) { 
    $web.SiteLogoUrl=$sitelogo 
    $web.Update() 
} 
$site.Dispose() 
