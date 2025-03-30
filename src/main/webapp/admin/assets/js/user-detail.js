const handleSubmitForm = () => {
    const fullname = document.querySelector(".fullname").value;
    const phone = document.querySelector(".phone-number").value;
    const email = document.querySelector(".email").value;
    const birthday = document.querySelector(".birthday").value;
    const statusChecked = document.querySelector('input[name="status"]:checked')?.value;
    const genderChecked = document.querySelector('input[name="gender"]:checked')?.value;
    const role = document.querySelector('input[name="role"]:checked')?.value;
    console.log("full name: " +fullname)
    console.log("phone: " +phone)
    console.log("email: " +email)
    console.log("birthday: " +birthday)
    console.log("status: " +statusChecked)
    console.log("gender: " +genderChecked)
    console.log("role: " +role)

    // TODO: validate r submit
    alert("submit")
}

const toggleEdit = () => {
    document.querySelector(".full-name").classList.toggle("d-none");
    const inputs = document.querySelectorAll("input[disabled]");
    inputs.forEach(input => {
        input.disabled = !input.disabled;
        input.classList.toggle("border-bottom")
    });
}

const toggleRadio = () => {
    document.querySelector(".status").classList.toggle("d-none");
    document.querySelector(".gender").classList.toggle("d-none");
    document.querySelector(".form-check-radio.gender-radio").classList.toggle("d-none");
    document.querySelector(".form-check-radio.status-radio").classList.toggle("d-none");
    document.querySelector(".role-radio").classList.toggle("d-none");
}

const toggleBtn = () => {
    document.querySelector(".buttons.edit").classList.toggle("d-none");
    document.querySelector(".buttons.action").classList.toggle("d-none");
}

const toggle = () => {
    toggleEdit();
    toggleRadio();
    toggleBtn();
}

const suspend = () => {
    // TODO: ban
    alert("M đã ban nó")
}

const init = () => {
    const editBtn = document.querySelector(".btn.edit");
    const suspendBtn = document.querySelector(".btn.suspend");
    const cancelBtn = document.querySelector(".btn.cancel")
    const saveBtn = document.querySelector(".save")

    editBtn.addEventListener("click", toggle);

    cancelBtn.addEventListener('click', toggle)

    suspendBtn.addEventListener('click', suspend);

    saveBtn.addEventListener('click', handleSubmitForm)
}

document.addEventListener("DOMContentLoaded", init);
