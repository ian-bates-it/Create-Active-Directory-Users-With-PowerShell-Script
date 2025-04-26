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



---
---
<br />
<br />


<h2>Create 100 Active Directory Domain Users with PowerShell</h2>



- Remote into the Windows 2022 Server Domain Controller.




---
<br />

<h3>Open PowerShell as an Administrator</h3>

- Click the Start Charm.
- Right-click `Windows PowerShell ISE`
- Select `Run as administrator` as shown below.


  <img src="https://github.com/user-attachments/assets/702b1571-15b7-4fd3-9d0e-4a2819b5e894" height="60%" width="60%" />


---
<br />

- Accept the UAC notification. Click `Yes` to continue.


  <img src="https://github.com/user-attachments/assets/65174e23-4a83-49ee-b084-26778331d254" height="60%" width="60%" />



---
<br />

<h3>Save the PowerShell Script on the Windows 2022 Server Desktop</h3>

- Save the [PowerShell script at this link](https://github.com/ian-bates-it/Create-Active-Directory-Users-With-PowerShell-Script/blob/main/create-ad-users-script.ps1), as a `.ps1` file on the Windows 2022 Server Desktop.


  <img src="https://github.com/user-attachments/assets/06127c9a-59b4-467a-a859-1fe187f43cfa" height="80%" width="80%" />


---
<br />

<h3>Double-Check Destination Organizational Unit Exists</h3>


- The [PowerShell script](https://github.com/ian-bates-it/Create-Active-Directory-Users-With-PowerShell-Script/blob/main/create-ad-users-script.ps1) relies on the existence of an organizational unit specifically called `_EMPLOYEES` to exist.
- So double check that the Active Directory Users and Groups shows an [OU called `_EMPLOYEES` which we created in the section of this documentation at this link](https://github.com/ian-bates-it/Active-Directory-Users-And-Computers?tab=readme-ov-file#create-an-organizational-unit-named-_employees).


  <img src="https://github.com/user-attachments/assets/b0ab5b34-47cd-4e1a-99d9-2a7889467198" height="60%" width="60%" />



---
<br />

<h3>Set-ExecutionPolicy Unrestricted</h3>

- To create 100 Domain Users with this [PowerShell script] we will need to set the appropriate execution policy in PowerShell.
- So run the command, `Set-ExecutionPolicy Unrestricted`, in PowerShell before running the new user script.

  <img src="https://github.com/user-attachments/assets/4b6e4bd6-e00d-4053-ab72-c242bfab8576" height="60%" width="60%" />



---
<br />

<h3>Run the PowerShell Script</h3>

- Press the green play button in the top management panel as shown below to run the script and create 100 new Active Directoryt Domain Users.

  <img src="https://github.com/user-attachments/assets/8a1195ce-5315-4f46-b510-e6e762c0c2de" height="80%" width="80%" />


---
<br />

<h3>Refresh the `_EMPLOYEES` Organizational Unit</h3>

- After running the [PowerShell script](https://github.com/ian-bates-it/Create-Active-Directory-Users-With-PowerShell-Script/blob/main/create-ad-users-script.ps1) you may need to refresh the `_EMPLOYEES` OU to see the new users that have been created.
- To do so, Right-click the `_EMPLOYEES` OU and select `Refresh` as shown below.

  <img src="https://github.com/user-attachments/assets/6fcd531a-6951-48e7-927d-b1f5617f7302" height="60%" width="60%" />


---
<br />

<h3>New AD Domain Users Created</h3>

- Then you should have 100 new users in the `_EMPLOYEES` organizational unit as shown below.


  <img src="https://github.com/user-attachments/assets/78963597-e219-4433-88dd-ff74cfc3e9fa" height="80%" width="80%" />





