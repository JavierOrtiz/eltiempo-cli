# Welcome to WeatherBcn

## Configuration
In order to start using this script, its needed have the `Affiliate ID` in order to get access to Tiempo.com API. To set up the Affiliate ID correctly, you should add in the `.bashrc` file the ENV `AFFILIATE_ID` with your current ID. Or you can write at the start of any command `AFFILIATE_ID=current-id ./eltiempo --command` 
 
You should apply some permissions to the file:
```shell
chmod 744 ./eltiempo
```

## How to use

Get the weather for today for a city:

```shell
# With ENV in .bashrc
./eltiempo --today 'Gavà'
# With ENV in command line
AFFILIATE_ID=current-tiempo-id ./eltiempo --today 'Gavà'
```
Get the average weather of the week for a city:

```shell
# With ENV in .bashrc
./eltiempo --av_max 'Gavà'
./eltiempo --av_min 'Gavà'
# With ENV in command line
AFFILIATE_ID=current-tiempo-id ./eltiempo --av_max 'Gavà'
AFFILIATE_ID=current-tiempo-id ./eltiempo --av_min 'Gavà'
```



