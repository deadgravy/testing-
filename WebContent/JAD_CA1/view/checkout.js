let closeIcon = document.getElementById("closeIcon");
let openIcon = document.getElementById("openIcon");
let dropdown = document.getElementById("dropdown");
let text = document.getElementById("changetext");
// more free and premium Tailwind CSS components at https://tailwinduikit.com/
const showMenu = (flag) => {
  if (flag) {
    closeIcon.classList.toggle("hidden");
    openIcon.classList.toggle("hidden");
    dropdown.classList.toggle("hidden");
  } else {
    closeIcon.classList.toggle("hidden");
    openIcon.classList.toggle("hidden");
    dropdown.classList.toggle("hidden");
  }
};

const changeText = (country) => {
  text.innerHTML = country;
  closeIcon.classList.toggle("hidden");
  openIcon.classList.toggle("hidden");
  dropdown.classList.toggle("hidden");
};