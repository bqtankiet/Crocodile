function User (fullname, phone, email, birthday, active, gender, role) {
    this.fullname = fullname;
    this.phone = phone;
    this.email = email;
    this.birthday = birthday;
    this.active = active;
    this.gender = gender;
    this.role = role;
}

function validateFullName(fullname) {
    const regex = /[<>@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?`~!]/;
    return !(fullname.length > 20 || regex.test(fullname));
}

function validatePhoneNumber(phone) {
    const phoneRegex = /^(0[3|5|7|8|9])\d{8}$/;
    return phoneRegex.test(phone);
}

function validateEmail(email) {
    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    return emailRegex.test(email);
}

const handleSubmitForm = () => {
    const fullname = document.querySelector(".fullname").value;
    const phone = document.querySelector(".phone-number").value;
    const email = document.querySelector(".email").value;
    const birthday = document.querySelector(".birthday").value;
    const active = document.querySelector('input[name="status"]:checked')?.value;
    const gender = document.querySelector('input[name="gender"]:checked')?.value;
    const role = document.querySelector('input[name="role"]:checked')?.value;

    const isValidFullName = validateFullName(fullname)
    const isValidPhone = validatePhoneNumber(phone)
    const isValidEmail = validateEmail(email)

    if (isValidFullName && isValidPhone && isValidEmail) {
        let user = new User(fullname, phone, email, birthday, active, gender, role);
        console.log(user)
        fetch('http://localhost:8080/crocodile/admin/user/update', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(user)
        })
            .then(response => {

                if (!response.ok) {
                    throw new Error('Lỗi HTTP: ' + response.status);
                }
                console.log("Request đã được gửi!");
                return response.json();
            })
            .then(data => console.log("Dữ liệu phản hồi:", data))
            .catch(error => console.error("Lỗi:", error));


    }
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
