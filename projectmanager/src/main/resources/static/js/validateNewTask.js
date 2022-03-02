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