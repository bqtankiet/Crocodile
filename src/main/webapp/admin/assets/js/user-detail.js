const url = '/admin/user/update';

function validateFullName(fullname) {
    const regex = /[<>@#$%^&*()_+\-=\[\]{};':"\\|,.\/?`~!]/;
    return !(fullname.length > 20 || regex.test(fullname));
}

function validatePhoneNumber(phone) {
    const phoneRegex = /^(0[1-9][0-9]{8,9})$/;
    return phoneRegex.test(phone);
}

function validateEmail(email) {
    const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    return emailRegex.test(email);
}

const updateUser = async (url, data) => {
    const response = await fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
    });
    return response.json();
}

const handleSubmitForm = async () => {
    const id = document.querySelector(".id").value;
    const fullname = document.querySelector(".fullname").value;
    const phone = document.querySelector(".phone-number").value;
    const email = document.querySelector(".email").value;
    const birthdate = document.querySelector(".birthdate").value;
    const active = document.querySelector('input[name="status"]:checked')?.value;
    const gender = document.querySelector('input[name="gender"]:checked')?.value;
    const role = document.querySelector('input[name="role"]:checked')?.value;

    const isValidFullName = validateFullName(fullname)
    const isValidPhone = validatePhoneNumber(phone)
    const isValidEmail = validateEmail(email)

    if (isValidFullName && isValidPhone && isValidEmail) {
        const data =
            {
                id: id,
                fullname: fullname,
                phoneNumber: phone,
                email: email,
                birthdate: birthdate,
                active: active,
                gender: gender,
                role: role,
                action: 'updateInfo'
            }

        try {
            const response = await updateUser(url, data);
            console.log(response)
            window.location.reload()
        } catch (error) {
            console.error("Lỗi khi cập nhật:", error);
        }

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

const suspend = async () => {
    const id = document.querySelector(".id").value;
    const active = document.querySelector('input[name="status"]:checked')?.value;

    const data =
        {
            id: id,
            active: active,
            action: 'toggleBan'
        };

    try {
        const response = await updateUser(url, data)
        window.location.reload()
        console.log(response)
    } catch (error) {
        console.error("Lỗi khi cập nhật:", error);
    }

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
