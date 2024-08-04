
# Tailscale Setup Instructions

## How to Set Up Tailscale for Use with My Servers

1. Download Tailscale for Windows from[https://pkgs.tailscale.com/stable/tailscale-setup-latest.exe].
2. Run the downloaded file and allow any prompts from Windows Defender.
3. Upon setting up, log in to Tailscale using Google. USE THESE CREDENTIALS ONLY:
   

   Email: vividlee.servers.guest@gmail.com

   Pass:  95e8e6e5-fa99-46f9-bd17-3366a734281e

   
4. This next step is extremely important. Connect your device to the 'vividleeservers@gmail.com' Tailnet. DO NOT click the first option that appears. If you click the first option, you will not be able to connect to the server as that is not my Tailnet. Tailscale is dumb, and creates un-deleteable Tailnets for every account, including the guest account you are signing in with. For clarity, review the image below.
![image](https://github.com/user-attachments/assets/ff7259f0-b5b8-48d1-b9ba-29081d76ff02)


5. You should be connecting your device to the 'vividleeservers@gmail.com' Tailnet, using the account 'vividlee.servers.guest@gmail.com'. Please do not use your personal Google account.




## Important Considerations

Tailscale is a VPN that connects all users as if they were on the same Local Area Network (LAN). It is crucial to follow these security recommendations to ensure the safety of your PC.

## Security Recommendations

To enhance your security, please follow these steps:

1. Right-click the Tailscale icon in the system tray (bottom right corner for Windows users).
2. Go to "Preferences" and uncheck "Allow incoming connections". This will prevent anyone on the network from connecting to your PC.
3. Uncheck "Run unattended" to ensure that malicious actors cannot gain root access to your PC.
4. Consider disconnecting from Tailscale when it is not in use (e.g., when you are not connected to any game server).
