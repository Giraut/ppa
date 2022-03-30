# PPA repository for the following packages:

- [SiRFIDaL](https://github.com/Giraut/SiRFIDaL) - Simple RFID authentication for Linux
- [pyuFR](https://github.com/Giraut/pyuFR) - Pure Python communication class for Digital Logic uFR-series NFC readers
- [Wordle](https://github.com/Giraut/Wordle) - Wordle game for the Unix console
- [Vivokey Manager](https://github.com/Giraut/vivokey-manager) - Wrapper script for the Yubikey Manager (CLI) utility to use it with the Vivokey OTP applet
- [Vivokey PAM](https://github.com/Giraut/vivokey-pam) - PAM module and configuration utility to perform user authentication (1FA or 2FA) using a Vivokey device and the Vivokey OTP applet

# Adding the repository to your APT sources

```bash
curl -SsL https://raw.githubusercontent.com/Giraut/ppa/master/KEY.gpg | sudo apt-key add -
sudo curl -SsL -o /etc/apt/sources.list.d/giraut.list https://raw.githubusercontent.com/Giraut/ppa/master/giraut.list
sudo apt update
```

# Installing packages

```bash
sudo apt install sirfidal
sudo apt install python3-pyufr
sudo apt install wordle
sudo apt install vivokey-manager
sudo apt install vivokey-pam
```
