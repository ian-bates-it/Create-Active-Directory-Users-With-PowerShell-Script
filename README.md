<!--
Part 3_Creating Users With PowerShell
-->

<p align="center">
<img src="https://github.com/user-attachments/assets/c3b56316-1b3b-462a-be1e-539a3c20513a" height="50%" width="50%"/>
</p>



# Chapter 6: Add 100 Active Directory Users With A PowerShell Script

<!--
- Using ChatGPT, here is the [PowerShell script I used to create 100 users in Active Directory](https://github.com/ian-bates-it/Create-Active-Directory-Users-With-PowerShell-Script/blob/main/create-ad-users-script.ps1)
-->

- We are going to create 100 Domain Users in active directory using a [PowerShell script](https://github.com/ian-bates-it/Create-Active-Directory-Users-With-PowerShell-Script/blob/main/create-ad-users-script.ps1) and they will be members of our `_EMPLOYEES` organizational unit that we created [in this part of Chapter 4 on OU's.](https://github.com/ian-bates-it/Active-Directory-Users-And-Computers?tab=readme-ov-file#create-an-organizational-unit-named-_employees)
- These users will automatically be added to the default **`Domain Users` security group**.
- In `Part 1` of this chapter below, we will allow all members of the default `Domain Users` to remotely access our Windows 10 Pro virtual machine client.
- In `Parts 2 and 3` of this chapter, we will review and run a PowerShell script that will automate the process of creating 100 new Domain Users. 
- Then in `Part 4` we will refresh our Active Directory Users and Computers to see the new 100 Domain Users.
- Finally in `Part 5` of this chapter, we will select a random new user (`austin.taylor`) and use his credentials to remote into the Windows 10 Pro VM client. 

---
---



<h2>Environments and Technologies Used</h2>

- Microsoft Azure (Virtual Machines/Compute)
- Remote Desktop
- Active Directory Domain Services
- PowerShell

<h2>Operating Systems Used </h2>

- Windows Server 2022 (Domain Controller)
- Windows 10 Pro (21H2) (Client)

<h2>High-Level Configuration Steps</h2>

- Part 1: [Allow All Domain Users to Remotely Access the Windows 10 Pro Client Remote Desktop](https://github.com/ian-bates-it/Create-Active-Directory-Users-With-PowerShell-Script?tab=readme-ov-file#allow-all-domain-users-to-remotely-access-the-windows-10-pro-client-remote-desktop)
- Part 2: [Review PowerShell Script](https://github.com/ian-bates-it/Create-Active-Directory-Users-With-PowerShell-Script?tab=readme-ov-file#review-the-powershell-script)
- Part 3: [Create 100 Active Directory Users with a PowerShell Script](https://github.com/ian-bates-it/Create-Active-Directory-Users-With-PowerShell-Script?tab=readme-ov-file#create-100-active-directory-domain-users-with-powershell)
    - Set the Execution Policy to Unrestricted (`Set-ExecutionPolicy Unrestricted`)
- Part 4: [Refresh the `_EMPLOYEES` OU. View the 100 New Domain Users created with our .ps1 script](https://github.com/ian-bates-it/Create-Active-Directory-Users-With-PowerShell-Script?tab=readme-ov-file#refresh-the-_employees-organizational-unit)
- Part 5: [Confirm New Domain User Account Has Access To Our Windows 10 Pro Client VM](https://github.com/ian-bates-it/Create-Active-Directory-Users-With-PowerShell-Script?tab=readme-ov-file#confirm-new-domain-user-account-has-access-to-our-windows-10-pro-client-vm)
      - Select a random new Domain User (`austin.taylor`) and remote into the Windows 10 Pro Client VM with the new user's credentials. 



<h2>Prerequisites</h2>

1. Complete [Chapter 1 of this series, Creating a Windows 10 Pro and Windows 2022 Server Virtual Machines in Azure.](https://github.com/ian-bates-it/Azure-Virtual-Machine-Setup)

2. Complete [Chapter 2 of this series, Configuring the DNS settings for our Windows 10 Pro (Client) and Windows 2022 Server (Domain Controller).](https://github.com/ian-bates-it/Azure-Controller-Client-Configuration)

3. Complete [Chapter 3 of this series, Installing Active Directory on a Windows 2022 Server VM and promoting it to a Domain Controller.](https://github.com/ian-bates-it/Install-Active-Directory-on-Windows-2022-Server)

4. Complete [Chapter 4 of this series, Create Organizational Units and Users in Active Directory.](https://github.com/ian-bates-it/Active-Directory-Users-And-Computers)

5. Complete [Chapter 5 of this series, Join a Windows 10 Pro Client to a Windows 2022 Server Domain Controller.](https://github.com/ian-bates-it/Join-A-Client-To-A-Domain)


<br />
<br />

---

<h1>Part 1:</h1>

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




<br />
<br />

---

<h1>Part 2:</h1>

<h2>Review the PowerShell Script</h2>

- In this section we are creating global variables to hold the password for each user (`$PASSWORD_FOR_USERS`) and the number of accounts to create (`$NUMBER_OF_ACCOUNTS_TO_CREATE`)

```ps1

# ----- Set password and Number of AD Accounts to Create ----- #
$PASSWORD_FOR_USERS   = "Password1!"
$NUMBER_OF_ACCOUNTS_TO_CREATE = 100
# ------------------------------------------------------------ #

```

<br />
<br />

- In the next section we creating two arrays.
    - Note, in PowerShell, `@()` represents the array subexpression operator. It is used to create and initialize arrays. The `@()` syntax ensures that the result of an expression or command is treated as an array, even if it returns a single object or nothing.
- The first names are stored in an array called $firstNames.
- The last names are stored in an array called $lastNames as shown below.

```ps1

# Predefined first and last names (100 each)
$firstNames = @(
    "Aaron", "Abigail", "Adam", "Aiden", "Alex", "Alexa", "Alice", "Alyssa", "Amelia", "Andrew",
    "Angela", "Anna", "Anthony", "Ashley", "Austin", "Benjamin", "Blake", "Brandon", "Briana", "Caleb",
    "Cameron", "Carla", "Carter", "Charles", "Chloe", "Christian", "Christopher", "Claire", "Daniel", "David",
    "Dylan", "Eleanor", "Elijah", "Elizabeth", "Ella", "Emily", "Emma", "Eric", "Ethan", "Evan",
    "Faith", "Fiona", "Gabriel", "Gavin", "George", "Grace", "Hailey", "Hannah", "Harper", "Henry",
    "Hunter", "Ian", "Isaac", "Isabella", "Isla", "Jack", "Jackson", "Jacob", "Jasmine", "Jason",
    "Jayden", "Jennifer", "Jessica", "John", "Jonathan", "Jordan", "Joseph", "Joshua", "Julia", "Justin",
    "Kaitlyn", "Kayla", "Kevin", "Kyle", "Landon", "Laura", "Lauren", "Leo", "Liam", "Lily",
    "Logan", "Lucas", "Madeline", "Madison", "Maria", "Mason", "Matthew", "Megan", "Mia", "Michael",
    "Nathan", "Nicholas", "Noah", "Olivia", "Owen", "Rachel", "Ryan", "Samantha", "Samuel", "Sarah"
)

$lastNames = @(
    "Adams", "Allen", "Anderson", "Bailey", "Baker", "Barnes", "Bell", "Bennett", "Brooks", "Brown",
    "Butler", "Campbell", "Carter", "Clark", "Collins", "Cook", "Cooper", "Cox", "Cruz", "Davis",
    "Diaz", "Edwards", "Evans", "Fisher", "Flores", "Foster", "Garcia", "Gomez", "Gonzalez", "Gray",
    "Green", "Griffin", "Hall", "Harris", "Hayes", "Henderson", "Hill", "Howard", "Hughes", "Jackson",
    "James", "Jenkins", "Johnson", "Jones", "Kelly", "King", "Lee", "Lewis", "Long", "Martinez",
    "Miller", "Mitchell", "Moore", "Morgan", "Morris", "Murphy", "Nelson", "Nguyen", "Ortiz", "Owens",
    "Parker", "Patel", "Perez", "Perry", "Peterson", "Phillips", "Powell", "Price", "Ramirez", "Reed",
    "Reyes", "Richardson", "Rivera", "Roberts", "Robinson", "Rodriguez", "Rogers", "Ross", "Russell", "Sanchez",
    "Sanders", "Scott", "Simmons", "Smith", "Stewart", "Taylor", "Thomas", "Thompson", "Torres", "Turner",
    "Walker", "Ward", "Watson", "White", "Williams", "Wilson", "Wood", "Wright", "Young", "Zimmerman"
)

```

<br />
<br />


- Then we have a loop to make 100 people. 

```ps1

for ($i = 0; $i -lt $NUMBER_OF_ACCOUNTS_TO_CREATE; $i++) {

```

<br />
<br />


- In the next section, we grab a first name from the top of the $firstName array and then we grab a last name from the bottom of the $lastName array.
- So in this example,
    - The first user would be `Aaron Zimmerman`
    - The second user would be `Abigail Young`
    - The third user would be `Adam Wright`
    - and so on, until we reach the middle with the last two first and last names.

```ps1

$firstName = $firstNames[$i]
$lastName = $lastNames[$lastNames.Count - 1 - $i]


```



<br />
<br />


- In the next section, we make `username` by putting the first and last name together with a dot
    - So our first user would have a username of `Aaron.Zimmerman`
    - And our second user would have a username of `Abigail.Young`
  
```ps1

$username = "$firstName.$lastName"

```


<br />
<br />


- In the next section, we will take the generic password we are using for each user and which was defined above in our global variable (`$PASSWORD_FOR_USERS   = "Password1!"`) and we will convert it to a Secure String.

```ps1

$password = ConvertTo-SecureString $PASSWORD_FOR_USERS -AsPlainText -Force

```


<br />
<br />


- In the next section, we are printing out a line as confirmation to the console so we can see that a user is being created.
    - The `Write-Host` will print out the line "Creating user: $username" where it will replace the variable `$username` with the actual username it is creating.
    - This is like `echo` in php or `print()` in python.

```ps1

Write-Host "Creating user: $username"


```


<br />
<br />


- In the next section, we are actually making the user in Active Directory

```ps1

New-AdUser -AccountPassword $password `
           -GivenName $firstName `
           -Surname $lastName `
           -DisplayName $username `
           -Name $username `
           -EmployeeID $username `
           -PasswordNeverExpires $true `
           -Path "ou=_EMPLOYEES,$(([ADSI]'').distinguishedName)" `
           -Enabled $true


```

- Of particular importance is the line where we specify the organizational unit which the new user will belong to. That line is isolated below:


```ps1
           -Path "ou=_EMPLOYEES,$(([ADSI]'').distinguishedName)" `

```

<br />

- You can see the [full PowerShell script at this link here.](https://github.com/ian-bates-it/Create-Active-Directory-Users-With-PowerShell-Script/blob/main/create-ad-users-script.ps1)


<br />
<br />

---

<h1>Part 3:</h1>

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



<br />
<br />

---

<h1>Part 4:</h1>

<h3>Refresh the `_EMPLOYEES` Organizational Unit</h3>

- After running the [PowerShell script](https://github.com/ian-bates-it/Create-Active-Directory-Users-With-PowerShell-Script/blob/main/create-ad-users-script.ps1) you may need to refresh the `_EMPLOYEES` OU to see the new users that have been created.
- To do so, Right-click the `_EMPLOYEES` OU and select `Refresh` as shown below.

  <img src="https://github.com/user-attachments/assets/6fcd531a-6951-48e7-927d-b1f5617f7302" height="60%" width="60%" />


---
<br />

<h3>New AD Domain Users Created</h3>

- Then you should have 100 new users in the `_EMPLOYEES` organizational unit as shown below.


  <img src="https://github.com/user-attachments/assets/78963597-e219-4433-88dd-ff74cfc3e9fa" height="80%" width="80%" />




<br />
<br />

---

<h1>Part 5:</h1>

<h2>Confirm New Domain User Account Has Access To Our Windows 10 Pro Client VM</h2>

- To confirm that our new Domain Users can remotely access our Windows 10 Pro Client VM, select one of the new users.
- Here, I selected a user named `austin.taylor` with the default password of `Password1`

To test the remote connection, do the following: 

1. Enter the public IP address of the Windows 10 Pro VM. Here that would be `20.81.44.196`.
2. Enter the domain\new-user-username, so here that weould be `IanBates.com\Austin.Taylor.


  <img src="https://github.com/user-attachments/assets/84e90603-4f5b-4524-a909-775f1881a149" height="50%" width="50%" />


---
<br />

<h3>Run the command `query user`</h3>

- After you are logged into the Windows 10 Pro VM with one of the new user accounts, open the CMD terminal.
- Run the command `query user`
- Confirm that the details match as shown below.

  <img src="https://github.com/user-attachments/assets/74301ea6-a701-4cdf-9323-96da6bc555d7" height="80%" width="80%" />


---
---

