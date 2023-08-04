const updateAge = () => {
    const birthdateInput = document.getElementById("birthdate");
    const birthdate = new Date(birthdateInput.value);

    if (isNaN(birthdate)) {
        document.getElementById("result").innerText = " ";
        return;
    }

    const today = new Date();
    const ageInMilliseconds = today - birthdate;
    const ageInYears = ageInMilliseconds / (365.25 * 24 * 60 * 60 * 1000);
    const age = Math.floor(ageInYears);

    document.getElementById("result").innerText = `${age} years old.`;
};

const birthdateInput = document.getElementById("birthdate");
birthdateInput.addEventListener("change", updateAge);

// Calculate age on page load
updateAge();
document.getElementById("appointment").addEventListener("change", function() {
  // Get the selected date from the input field
  const selectedDate = new Date(this.value);

  // Array of days of the week
  const daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];

  // Get the day of the week (0 = Sunday, 1 = Monday, etc.)
  const dayOfWeekIndex = selectedDate.getDay();

  // Get the day of the week text based on the index
  const dayOfWeekText = daysOfWeek[dayOfWeekIndex];

  // Update the "result" div with the day of the week
  document.getElementById("result2").innerText = `Selected day: ${dayOfWeekText}`;
});