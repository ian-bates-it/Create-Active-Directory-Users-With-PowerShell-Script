# Create 100 Active Directory Users With A PowerShell Script


- Here is the [PowerShell script I used to create 100 users in Active Directory](https://github.com/ian-bates-it/Create-Active-Directory-Users-With-PowerShell-Script/blob/main/create-ad-users-script.ps1)


We are going to create 100 Domain Users in active directory using a PowerShell script. 

First, we will need to allow these new Domain users to remotely access our Windows 10 Pro virtual machine client.


---
---


<h2>Allow All Domain Users to Remotely Access the Windows 10 Pro Client Remote Desktop</h2>


<br />
<br />

<h3>Log into the Windows 10 Pro Client VM with an Admin Account</h3>

- Use Remote Desktop to connect to the Windows 10 Pro virtual machine.
- In this example, the public IP address of my Windows 10 Pro virtual machine was `20.115.81.20

1. Enter the public IP address of the Windows 10 Pro virtual machine. Mine was
2. Enter the domain\admin username in the user name field, so in my example that would be `IanBates.com\jdoe`
3. Connect as shown below.


  <img src="https://github.com/user-attachments/assets/d6cad741-c0e1-410e-88fe-7713c262cff1" height="40%" width="40%" />



---
<br />

<h3>Open Remote Desktop</h3>

- In the Windows 10 Pro virtual machine, select the Start Charm and then select `System`.
- In System > About, select the link for `Remote desktop` as shown below.



  <img src="https://github.com/user-attachments/assets/7011e6fd-03f7-405b-8276-25ede3e5f5ea" height="80%" width="80%" />


---
<br />

<h3>Remote Desktop > User Accounts</h3>

- In the Remote Desktop view, select the link under `User Accounts` that says `Select users that can remotely access this PC` as shown below.

  <img src="https://github.com/user-attachments/assets/387c7b4a-0338-49c5-90d5-74d792460c89" height="80%" width="80%" />



---
<br />

<h3>Remote Desktop Users > Add</h3>

- In the `Remote Desktop Users` window, click the `Add` button as shown below.

  <img src="https://github.com/user-attachments/assets/de5373d4-a5bc-4fb2-a8d9-5c236712eae2" height="40%" width="40%" />



---
<br />

<h3>Select Users or Groups</h3>

- In the `Select Users or Groups` dialog box, type `Domain Users` into the `Enter the object names to select` text box.
- Click the `Check Names` to confirm.
- Then select `OK` as shown below.


  <img src="https://github.com/user-attachments/assets/7377173f-4b68-461f-8962-9ac388c6a384" height="40%" width="40%" />



---
<br />

<h3>Domain Users Now Have Remote Desktop Access</h3>

- Now `Domain Users` can access the Windows 10 Pro virtual machine as shown below.
- Click `OK` to save and complete this task.


  <img src="https://github.com/user-attachments/assets/aa2582b2-45b8-4212-bbcb-e4486606c535" height="40%" width="40%" />





