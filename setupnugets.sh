
sudo docker exec -w /newki-libraries/ jenkins-blueocean git reset --hard  
echo 'pulling the latest version of newki-libraries'
sudo docker exec -w /newki-libraries/ jenkins-blueocean git pull  
echo 'build the latest version of newki-libraries'
sudo docker exec -w /newki-libraries/ jenkins-blueocean dotnet build  
echo 'pack the latest version of newki-libraries'
sudo docker exec -w /newki-libraries/ jenkins-blueocean dotnet pack
sudo docker exec -w /newki-libraries/ jenkins-blueocean dotnet nuget locals all --clear
echo 'upload to nuget the latest version of newki-libraries'
sudo docker exec -w /newki-libraries/bin/Debug/ jenkins-blueocean dotnet nuget push NewKiTurkeyLibrary.1.6.2.nupkg -s newki.australia
echo 'add to nuget the latest version of newki-libraries'
sudo docker exec -w /newki-libraries/ jenkins-blueocean dotnet nuget add source http://localhost:5000/v3/index.json -n newki.australia
sudo docker exec -w /newki-libraries/ jenkins-blueocean dotnet nuget add source https://api.nuget.org/v3/index.json -n nuget.org
echo 'Change ci server config username and email'
sudo docker exec -w /newki-libraries/ jenkins-blueocean git config --global user.name "CI server"
sudo docker exec -w /newki-libraries/ jenkins-blueocean git config --global user.email "info@newkitrade.com"
echo 'Done!'
dotnet nuget locals all --clear


