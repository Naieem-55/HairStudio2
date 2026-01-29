/* ============================================
   Hair Studio - UI Components JavaScript
   Toast Notifications, Loading Indicators,
   Form Validation, Password Strength Meter
   ============================================ */

// ============================================
// 1. TOAST NOTIFICATION SYSTEM
// ============================================

const Toast = {
    container: null,

    init: function() {
        if (!this.container) {
            this.container = document.createElement('div');
            this.container.className = 'toast-container';
            document.body.appendChild(this.container);
        }
    },

    show: function(message, type = 'info', duration = 4000) {
        this.init();

        const toast = document.createElement('div');
        toast.className = `toast toast-${type}`;

        const icons = {
            success: 'fa-check-circle',
            error: 'fa-times-circle',
            warning: 'fa-exclamation-triangle',
            info: 'fa-info-circle'
        };

        const titles = {
            success: 'Success',
            error: 'Error',
            warning: 'Warning',
            info: 'Information'
        };

        toast.innerHTML = `
            <span class="toast-icon"><i class="fas ${icons[type]}"></i></span>
            <div class="toast-content">
                <div class="toast-title">${titles[type]}</div>
                <div class="toast-message">${message}</div>
            </div>
            <button class="toast-close" onclick="Toast.close(this.parentElement)">&times;</button>
        `;

        this.container.appendChild(toast);

        // Trigger animation
        setTimeout(() => toast.classList.add('show'), 10);

        // Auto dismiss
        if (duration > 0) {
            setTimeout(() => this.close(toast), duration);
        }

        return toast;
    },

    close: function(toast) {
        if (!toast) return;
        toast.classList.add('hiding');
        toast.classList.remove('show');
        setTimeout(() => {
            if (toast.parentElement) {
                toast.parentElement.removeChild(toast);
            }
        }, 300);
    },

    success: function(message, duration) {
        return this.show(message, 'success', duration);
    },

    error: function(message, duration) {
        return this.show(message, 'error', duration);
    },

    warning: function(message, duration) {
        return this.show(message, 'warning', duration);
    },

    info: function(message, duration) {
        return this.show(message, 'info', duration);
    }
};

// ============================================
// 2. LOADING INDICATOR
// ============================================

const Loading = {
    overlay: null,

    init: function() {
        if (!this.overlay) {
            this.overlay = document.createElement('div');
            this.overlay.className = 'loading-overlay';
            this.overlay.innerHTML = `
                <div class="spinner spinner-lg"></div>
                <div class="loading-text">Please wait...</div>
            `;
            document.body.appendChild(this.overlay);
        }
    },

    show: function(text = 'Please wait...') {
        this.init();
        this.overlay.querySelector('.loading-text').textContent = text;
        this.overlay.classList.add('active');
    },

    hide: function() {
        if (this.overlay) {
            this.overlay.classList.remove('active');
        }
    },

    // Button loading state
    buttonLoading: function(button, loading = true) {
        if (loading) {
            button.classList.add('btn-loading');
            button.dataset.originalText = button.innerHTML;
            button.innerHTML = `<span class="btn-text">${button.innerHTML}</span>`;
            button.disabled = true;
        } else {
            button.classList.remove('btn-loading');
            if (button.dataset.originalText) {
                button.innerHTML = button.dataset.originalText;
            }
            button.disabled = false;
        }
    }
};

// ============================================
// 3. FORM VALIDATION
// ============================================

const FormValidator = {
    // Validation rules
    rules: {
        required: (value) => value.trim() !== '',
        email: (value) => /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(value),
        phone: (value) => /^[\d\s\-\(\)\+]{7,20}$/.test(value),
        minLength: (value, length) => value.length >= length,
        maxLength: (value, length) => value.length <= length,
        numeric: (value) => /^\d+$/.test(value),
        decimal: (value) => /^\d+(\.\d{1,2})?$/.test(value),
        alphanumeric: (value) => /^[a-zA-Z0-9_]+$/.test(value),
        password: (value) => value.length >= 8 && /[a-zA-Z]/.test(value) && /\d/.test(value),
        match: (value, targetId) => {
            const target = document.getElementById(targetId);
            return target && value === target.value;
        }
    },

    // Error messages
    messages: {
        required: 'This field is required',
        email: 'Please enter a valid email address',
        phone: 'Please enter a valid phone number',
        minLength: 'Minimum {0} characters required',
        maxLength: 'Maximum {0} characters allowed',
        numeric: 'Please enter only numbers',
        decimal: 'Please enter a valid decimal number',
        alphanumeric: 'Only letters, numbers, and underscores allowed',
        password: 'Password must be at least 8 characters with letters and numbers',
        match: 'Fields do not match'
    },

    // Validate a single field
    validateField: function(input) {
        const validations = input.dataset.validate;
        if (!validations) return true;

        const rules = validations.split('|');
        let isValid = true;
        let errorMessage = '';

        for (const rule of rules) {
            const [ruleName, ruleParam] = rule.split(':');
            const value = input.value;

            if (this.rules[ruleName]) {
                const valid = ruleParam
                    ? this.rules[ruleName](value, ruleParam)
                    : this.rules[ruleName](value);

                if (!valid) {
                    isValid = false;
                    errorMessage = this.messages[ruleName].replace('{0}', ruleParam);
                    break;
                }
            }
        }

        this.updateFieldStatus(input, isValid, errorMessage);
        return isValid;
    },

    // Update field visual status
    updateFieldStatus: function(input, isValid, message = '') {
        const formGroup = input.closest('.form-group') || input.parentElement;

        // Remove existing feedback
        input.classList.remove('is-valid', 'is-invalid');
        const existingFeedback = formGroup.querySelector('.invalid-feedback, .valid-feedback');
        if (existingFeedback) {
            existingFeedback.remove();
        }

        if (input.value.trim() === '' && !input.dataset.validate?.includes('required')) {
            return; // Don't show status for empty optional fields
        }

        // Add new status
        if (isValid) {
            input.classList.add('is-valid');
        } else {
            input.classList.add('is-invalid');
            const feedback = document.createElement('div');
            feedback.className = 'invalid-feedback';
            feedback.textContent = message;
            input.parentElement.appendChild(feedback);
        }
    },

    // Validate entire form
    validateForm: function(form) {
        const inputs = form.querySelectorAll('[data-validate]');
        let isValid = true;

        inputs.forEach(input => {
            if (!this.validateField(input)) {
                isValid = false;
            }
        });

        return isValid;
    },

    // Initialize real-time validation
    init: function(formSelector) {
        const form = document.querySelector(formSelector);
        if (!form) return;

        const inputs = form.querySelectorAll('[data-validate]');

        inputs.forEach(input => {
            // Validate on blur
            input.addEventListener('blur', () => this.validateField(input));

            // Validate on input (with debounce)
            let timeout;
            input.addEventListener('input', () => {
                clearTimeout(timeout);
                timeout = setTimeout(() => this.validateField(input), 300);
            });
        });

        // Validate on form submit
        form.addEventListener('submit', (e) => {
            if (!this.validateForm(form)) {
                e.preventDefault();
                Toast.error('Please correct the errors in the form');
            }
        });
    }
};

// ============================================
// 4. PASSWORD STRENGTH METER
// ============================================

const PasswordStrength = {
    init: function(inputSelector, options = {}) {
        const input = document.querySelector(inputSelector);
        if (!input) return;

        const wrapper = input.parentElement;
        wrapper.classList.add('password-wrapper');

        // Add toggle button
        if (options.showToggle !== false) {
            const toggle = document.createElement('button');
            toggle.type = 'button';
            toggle.className = 'password-toggle';
            toggle.innerHTML = '<i class="fas fa-eye"></i>';
            toggle.addEventListener('click', () => {
                const isPassword = input.type === 'password';
                input.type = isPassword ? 'text' : 'password';
                toggle.innerHTML = `<i class="fas fa-eye${isPassword ? '-slash' : ''}"></i>`;
            });
            wrapper.style.position = 'relative';
            wrapper.appendChild(toggle);
        }

        // Add strength meter
        const strengthContainer = document.createElement('div');
        strengthContainer.className = 'password-strength';
        strengthContainer.innerHTML = `
            <div class="password-strength-bar">
                <div class="password-strength-fill"></div>
            </div>
            <div class="password-strength-text"></div>
            ${options.showRequirements !== false ? `
            <div class="password-requirements">
                <small>Password requirements:</small>
                <ul>
                    <li data-req="length">At least 8 characters</li>
                    <li data-req="letter">At least one letter</li>
                    <li data-req="number">At least one number</li>
                </ul>
            </div>
            ` : ''}
        `;
        wrapper.parentElement.appendChild(strengthContainer);

        // Update on input
        input.addEventListener('input', () => this.checkStrength(input, strengthContainer));
    },

    checkStrength: function(input, container) {
        const password = input.value;
        const fill = container.querySelector('.password-strength-fill');
        const text = container.querySelector('.password-strength-text');
        const requirements = container.querySelectorAll('[data-req]');

        // Check requirements
        const checks = {
            length: password.length >= 8,
            letter: /[a-zA-Z]/.test(password),
            number: /\d/.test(password),
            special: /[!@#$%^&*(),.?":{}|<>]/.test(password),
            uppercase: /[A-Z]/.test(password),
            lowercase: /[a-z]/.test(password)
        };

        // Update requirement indicators
        requirements.forEach(req => {
            const reqType = req.dataset.req;
            if (checks[reqType]) {
                req.classList.add('met');
            } else {
                req.classList.remove('met');
            }
        });

        // Calculate strength
        let strength = 0;
        if (checks.length) strength++;
        if (checks.letter) strength++;
        if (checks.number) strength++;
        if (checks.special) strength++;
        if (checks.uppercase && checks.lowercase) strength++;

        // Update UI
        fill.className = 'password-strength-fill';
        text.className = 'password-strength-text';

        if (password.length === 0) {
            text.textContent = '';
            return;
        }

        if (strength <= 1) {
            fill.classList.add('strength-weak');
            text.classList.add('strength-weak');
            text.textContent = 'Weak';
        } else if (strength <= 2) {
            fill.classList.add('strength-fair');
            text.classList.add('strength-fair');
            text.textContent = 'Fair';
        } else if (strength <= 3) {
            fill.classList.add('strength-good');
            text.classList.add('strength-good');
            text.textContent = 'Good';
        } else {
            fill.classList.add('strength-strong');
            text.classList.add('strength-strong');
            text.textContent = 'Strong';
        }
    }
};

// ============================================
// 5. IMAGE PREVIEW (consolidated from ASPX pages)
// ============================================

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#imageview').attr('src', e.target.result);
        };
        reader.readAsDataURL(input.files[0]);
    }
}

// ============================================
// 6. UTILITY FUNCTIONS
// ============================================

// Debounce function
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Format currency
function formatCurrency(amount, currency = 'USD') {
    return new Intl.NumberFormat('en-US', {
        style: 'currency',
        currency: currency
    }).format(amount);
}

// Confirm dialog replacement
function confirmAction(message, onConfirm, onCancel) {
    if (confirm(message)) {
        if (onConfirm) onConfirm();
    } else {
        if (onCancel) onCancel();
    }
}

// ============================================
// 7. AUTO-INITIALIZATION
// ============================================

document.addEventListener('DOMContentLoaded', function() {
    // Initialize Toast container
    Toast.init();

    // Show loading on form submit (for ASP.NET postbacks)
    const forms = document.querySelectorAll('form');
    forms.forEach(form => {
        form.addEventListener('submit', function(e) {
            // Check if validation passes
            const invalidInputs = form.querySelectorAll('.is-invalid');
            if (invalidInputs.length > 0) {
                return;
            }

            // Show loading for buttons
            const submitBtn = form.querySelector('[type="submit"], .btn-primary');
            if (submitBtn && !submitBtn.classList.contains('no-loading')) {
                Loading.buttonLoading(submitBtn, true);
            }
        });
    });

    // Initialize password strength for password fields on signup pages
    const passwordFields = document.querySelectorAll('input[type="password"][id*="10"], input[type="password"][id*="Password"]');
    passwordFields.forEach(field => {
        if (field.closest('form')?.querySelector('h3')?.textContent?.includes('Sign Up')) {
            PasswordStrength.init('#' + field.id);
        }
    });

    // Add validation attributes based on input types
    document.querySelectorAll('input[type="email"]').forEach(input => {
        if (!input.dataset.validate) {
            input.dataset.validate = 'email';
        }
    });

    // Initialize form validation for forms with validation
    document.querySelectorAll('form').forEach((form, index) => {
        FormValidator.init('form');
    });
});

// ============================================
// 8. GLOBAL ERROR HANDLER FOR SERVER MESSAGES
// ============================================

// Override alert to use Toast (called from server-side)
window.showToast = function(message, type = 'info') {
    Toast.show(message, type);
};

// Helper function for ASP.NET to call
window.showSuccessToast = function(message) {
    Toast.success(message);
};

window.showErrorToast = function(message) {
    Toast.error(message);
};

window.showWarningToast = function(message) {
    Toast.warning(message);
};

window.showInfoToast = function(message) {
    Toast.info(message);
};
