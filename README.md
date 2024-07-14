
# Tailscale Setup Instructions

## How to Set Up Tailscale for Use with My Servers

1. Use my link and download Tailscale for Windows from(https://login.tailscale.com/uinv/i2aaf11e47d85f85c).
2. Log in using your Google account and click "Connect".
3. Run the downloaded file and allow any prompts from Windows Defender.

## Important Considerations

Tailscale is a VPN that connects all users as if they were on the same Local Area Network (LAN). It is crucial to follow these security recommendations to ensure the safety of your PC.

## Security Recommendations

As the owner of the Tailnet, I can connect to your PC via SSH. To enhance your security, please follow these steps:

1. Right-click the Tailscale icon in the system tray (bottom right corner for Windows users).
2. Go to "Preferences" and uncheck "Allow incoming connections". This will prevent anyone on the network from connecting to your PC.
3. Uncheck "Run unattended" to ensure that malicious actors cannot gain root access to your PC.
4. Consider disconnecting from Tailscale when it is not in use (e.g., when you are not connected to any game server).
