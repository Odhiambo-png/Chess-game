<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voting System</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            color: #333;
            margin: 0;
            padding: 0;
        }
        h2 {
            font-size: 2rem;
            color: #004080;
            margin: 20px 0;
        }
        button {
            padding: 10px 20px;
            margin: 10px;
            background-color: #004080;
            color: white;
            font-size: 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #003366;
        }
        .form-section, .form-fields, .results-section { 
            display: none;
            margin: 20px auto;
            width: 80%;
            max-width: 600px;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .form-fields label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
        }
        .form-fields input[type="text"] {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .form-fields button {
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            font-size: 1.2rem;
            margin-top: 15px;
        }
        .form-fields button:hover {
            background-color: #218838;
        }

        /* Results Section Styles */
        .position {
            margin-top: 30px;
            font-size: 1.5rem;
            color: #0056b3;
        }
        .picture-space {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin-top: 20px;
        }
        .picture {
            width: 18%;
            height: 100px;
            margin: 0 1%;
            border: 1px dashed #ccc;
            background-color: #f9f9f9;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            cursor: pointer;
            border-radius: 8px;
            transition: transform 0.3s ease;
        }
        .picture:hover {
            transform: scale(1.05);
        }
        .tick {
            display: none;
            position: absolute;
            bottom: 5px;
            left: 50%;
            transform: translateX(-50%);
            color: green;
            font-size: 20px;
        }
        .picture img {
            width: 80%;
            height: auto;
            border-radius: 5px;
        }

        /* Hide unselected pictures */
        .hidden {
            display: none;
        }
    </style>
</head>
<body>

    <h2>Welcome to the Voting System</h2>

    <!-- Main Buttons -->
    <button id="voterButton" onclick="showVoterOptions()">Voter</button>
    <button id="candidateButton" onclick="showCandidateOptions()">Candidate</button>

    <!-- Voter Options -->
    <div id="voterSection" class="form-section">
        <button id="registerButton" onclick="showRegisterForm()">Register</button>
        <button id="loginButton" onclick="showLoginForm()">Login</button>

        <!-- Registration Form -->
        <div id="registerForm" class="form-fields">
            <h3>Voter Registration</h3>
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" placeholder="Enter First Name">
            <label for="secondName">Second Name:</label>
            <input type="text" id="secondName" placeholder="Enter Second Name">
            <label for="idNumber">ID Number:</label>
            <input type="text" id="idNumber" placeholder="Enter ID Number">
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" id="phoneNumber" placeholder="Enter Phone Number">
            <label for="voterNumber">Voter Number:</label>
            <input type="text" id="voterNumber" placeholder="Enter Voter Number">
            <button onclick="submitVoter('register')">Submit Registration</button>
        </div>

        <!-- Login Form -->
        <div id="loginForm" class="form-fields">
            <h3>Voter Login</h3>
            <label for="loginName">Name:</label>
            <input type="text" id="loginName" placeholder="Enter Your Name">
            <label for="loginIdNumber">ID Number:</label>
            <input type="text" id="loginIdNumber" placeholder="Enter ID Number">
            <label for="loginVoterNumber">Voter Number:</label>
            <input type="text" id="loginVoterNumber" placeholder="Enter Voter Number">
            <button onclick="submitVoter('login')">Submit Login</button>
        </div>
    </div>

    <!-- Candidate Options -->
    <div id="candidateSection" class="form-section">
        <button id="candidateRegisterButton" onclick="showCandidateRegisterForm()">Register</button>
        <button id="candidateLoginButton" onclick="showCandidateLoginForm()">Login</button>

        <!-- Candidate Registration Form -->
        <div id="candidateRegisterForm" class="form-fields">
            <h3>Candidate Registration</h3>
            <label for="candidateFirstName">First Name:</label>
            <input type="text" id="candidateFirstName" placeholder="Enter First Name">
            <label for="candidateSecondName">Second Name:</label>
            <input type="text" id="candidateSecondName" placeholder="Enter Second Name">
            <label for="candidateIdNumber">ID Number:</label>
            <input type="text" id="candidateIdNumber" placeholder="Enter ID Number">
            <label for="candidateNumber">Candidate Number:</label>
            <input type="text" id="candidateNumber" placeholder="Enter Candidate Number">
            <label for="candidateVoterNumber">Voter Number:</label>
            <input type="text" id="candidateVoterNumber" placeholder="Enter Voter Number">
            <label for="candidatePhoneNumber">Phone Number:</label>
            <input type="text" id="candidatePhoneNumber" placeholder="Enter Phone Number">
            <label for="candidateCounty">County:</label>
            <input type="text" id="candidateCounty" placeholder="Enter County">
            <label for="candidateConstituency">Constituency:</label>
            <input type="text" id="candidateConstituency" placeholder="Enter Constituency">
            <label for="candidateSeatPosition">Seat Position:</label>
            <input type="text" id="candidateSeatPosition" placeholder="Enter Seat Position">
            <button onclick="submitCandidate()">Submit Registration</button>
        </div>

        <!-- Candidate Login Form -->
        <div id="candidateLoginForm" class="form-fields">
            <h3>Candidate Login</h3>
            <label for="candidateLoginName">Name:</label>
            <input type="text" id="candidateLoginName" placeholder="Enter Your Name">
            <label for="candidateLoginIdNumber">ID Number:</label>
            <input type="text" id="candidateLoginIdNumber" placeholder="Enter ID Number">
            <label for="candidateLoginVoterNumber">Voter Number:</label>
            <input type="text" id="candidateLoginVoterNumber" placeholder="Enter Voter Number">
            <button onclick="submitCandidateLogin()">Submit Login</button>
        </div>
    </div>

    <!-- Results Section -->
    <div id="resultsSection" class="results-section">
        <h1>President</h1>
        <div class="picture-space" id="presidentPictures">
            <!-- Picture Divs Here -->
        </div>

        <h2 class="position">Governor</h2>
        <div class="picture-space" id="governorPictures">
            <!-- Picture Divs Here -->
        </div>

        <h2 class="position">Senator</h2>
        <div class="picture-space" id="senatorPictures">
            <!-- Picture Divs Here -->
        </div>

        <h2 class="position">Women Representative</h2>
        <div class="picture-space" id="womenRepPictures">
            <!-- Picture Divs Here -->
        </div>

        <h2 class="position">Member of Parliament</h2>
        <div class="picture-space" id="mpPictures">
            <!-- Picture Divs Here -->
        </div>

        <h2 class="position">Member of County Assembly (MCA)</h2>
        <div class="picture-space" id="mcaPictures">
            <!-- Picture Divs Here -->
        </div>

        <!-- Vote Button -->
        <button id="voteButton" onclick="submitVote()">Vote</button>
    </div>

    <script>
         function showVoterOptions() {
            document.getElementById("voterButton").style.display = "none";
            document.getElementById("candidateButton").style.display = "none";
            document.getElementById("voterSection").style.display = "block";
        }

        // Function to show candidate options and hide both main buttons
        function showCandidateOptions() {
            document.getElementById("voterButton").style.display = "none";
            document.getElementById("candidateButton").style.display = "none";
            document.getElementById("candidateSection").style.display = "block";
        }

        // Show Register Form Fields and hide the Register button
        function showRegisterForm() {
            document.getElementById("registerButton").style.display = "none";
            document.getElementById("loginButton").style.display = "none";
            document.getElementById("registerForm").style.display = "block";
        }

        // Show Login Form Fields and hide the Login button
        function showLoginForm() {
            document.getElementById("loginButton").style.display = "none";
            document.getElementById("registerButton").style.display = "none";
            document.getElementById("loginForm").style.display = "block";
        }

        // Show Candidate Registration Form Fields and hide the Candidate Register button
        function showCandidateRegisterForm() {
            document.getElementById("candidateRegisterButton").style.display = "none";
            document.getElementById("candidateLoginButton").style.display = "none";
            document.getElementById("candidateRegisterForm").style.display = "block";
        }

        // Show Candidate Login Form Fields and hide the Candidate Login button
        function showCandidateLoginForm() {
            document.getElementById("candidateLoginButton").style.display = "none";
            document.getElementById("candidateRegisterButton").style.display = "none";
            document.getElementById("candidateLoginForm").style.display = "block";
        }

        // Placeholder function for voter registration/login submission
        function submitVoter(action) {
            alert(action === 'register' ? "Registering Voter..." : "Logging in Voter...");
            // Add form submission logic here
            showResults();
        }

        // Placeholder function for candidate registration submission
        function submitCandidate() {
            alert("Registering Candidate...");
            // Add form submission logic here
            showResults();
        }

        // Placeholder function for candidate login submission
        function submitCandidateLogin() {
            alert("Logging in Candidate...");
            // Add form submission logic here
            showResults();
        }

        // Show results section and hide other sections
        function showResults() {
            document.querySelectorAll('.form-section, .form-fields').forEach(section => section.style.display = "none");
            document.getElementById("resultsSection").style.display = "block";
        }

        // Function to select a picture
        function selectPicture(pictureElement) {
            // Deselect previously selected pictures in the same section
            const parentSpace = pictureElement.parentElement;
            const ticks = parentSpace.querySelectorAll('.tick');
            ticks.forEach(tick => tick.style.display = "none");

            // Show the tick for the selected picture
            const tick = pictureElement.querySelector('.tick');
            tick.style.display = "block";
        }

        // Function to handle vote submission
        function submitVote() {
            const sections = ['presidentPictures', 'governorPictures', 'senatorPictures', 'womenRepPictures', 'mpPictures', 'mcaPictures'];
            sections.forEach(sectionId => {
                const pictures = document.getElementById(sectionId).querySelectorAll('.picture');
                pictures.forEach(picture => {
                    const tick = picture.querySelector('.tick');
                    if (tick.style.display === "block") {
                        picture.classList.remove('hidden'); // Keep selected picture
                    } else {
                        picture.classList.add('hidden'); // Hide unselected picture
                    }
                });
            });
            alert("Vote Submitted! Thank you for participating.");
            // Add vote submission logic here
        }
        // JavaScript functions go here...
    </script>

</body>
</html>
