(function() {
    const dateControl = document.querySelectorAll('.requires-validation.validate-save.date-control');
    const today = new Date().toISOString().split('T')[0];

    dateControl.forEach((control) => {
        control.setAttribute('min', today);
    });
})();

const validate = document.querySelector('#validate');
validate.addEventListener('submit', (event) => {
	const inputs = document.querySelectorAll('.requires-validation.validate-save');
	
	const isValid = Validate(Array.from(inputs));
	
	if (isValid) {
		const backendValidation = document.querySelectorAll('.backend-validation');
		backendValidation.forEach(validation => {
			validation.classList.add('d-none');
		});
		
		return true;
	} else {
		event.preventDefault();
	}
});