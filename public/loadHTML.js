async function loadHTML(selector, file, element = null) {
    try {
        const response = await fetch(file);
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        const data = await response.text();
        if (element) {
            const $div = $("<div>").html(data);
            $(selector).html($div.find(element));
        } else {
            $(selector).html(data);
        }
    } catch (error) {
        console.error('Error loading HTML:', error);
    }
}
