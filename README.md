```bash
./vless-check 'vless://4c69f6a2-8a88-4b0a-bc42-42fade4808a6@something.net?security=reality&type=tcp&flow=xtls-rprx-vision'
```

runs xray, curls https://wtfismyip.com/, outputs

```json
{
  "YourFuckingIPAddress": "127.0.0.1",
  "YourFuckingLocation": "Warsaw, 14, Poland",
  "YourFuckingHostname": "127.0.0.1",
  "YourFuckingISP": "Datacamp Limited",
  "YourFuckingTorExit": false,
  "YourFuckingCity": "Warsaw",
  "YourFuckingCountry": "Poland",
  "YourFuckingCountryCode": "PL"
}
```
