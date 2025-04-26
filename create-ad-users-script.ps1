# ----- Set password and Number of AD Accounts to Create ----- #
$PASSWORD_FOR_USERS   = "Password1!"
$NUMBER_OF_ACCOUNTS_TO_CREATE = 100
# ------------------------------------------------------------ #

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

for ($i = 0; $i -lt $NUMBER_OF_ACCOUNTS_TO_CREATE; $i++) {
    $firstName = $firstNames[$i]
    $lastName = $lastNames[$lastNames.Count - 1 - $i]
    $username = "$firstName.$lastName"
    $password = ConvertTo-SecureString $PASSWORD_FOR_USERS -AsPlainText -Force

    Write-Host "Creating user: $username" -BackgroundColor Black -ForegroundColor Cyan

    New-AdUser -AccountPassword $password `
               -GivenName $firstName `
               -Surname $lastName `
               -DisplayName $username `
               -Name $username `
               -EmployeeID $username `
               -PasswordNeverExpires $true `
               -Path "ou=_EMPLOYEES,$(([ADSI]'').distinguishedName)" `
               -Enabled $true
}
