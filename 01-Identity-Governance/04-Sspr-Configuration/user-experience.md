# SSPR User Experience (Expected Flow)

Because SSPR could not be enabled without P1 licenses, this section describes the standard user experience based on Microsoft documentation.

## Registration
- User navigates to https://aka.ms/sspr.
- Signs in with their corporate account.
- Registers authentication methods: mobile phone, email, and answers 3 security questions.
- Registration is forced at next sign-in if configured.

## Password Reset
- User clicks “Forgot my password?” on the login page.
- Completes CAPTCHA.
- Verifies identity using **two** methods (e.g., SMS code + answer to a security question).
- Enters a new password that meets the organization’s policy.
- Receives a success confirmation and can sign in immediately.

## Screens (illustrative)
*(If you want, you can include generic screenshots from Microsoft’s public documentation or training materials, citing the source.)*

## Benefit
This process takes under 3 minutes and eliminates the need for a help desk call.

# User Experience: SSPR Flow

## Registration
- User navigates to aka.ms/sspr.
- Registers phone, email, and answers 3 security questions.

## Reset Flow
- User signs out.
- Clicks "Forgot my password".
- Provides two authentication methods.
- Password successfully reset.

## Screenshot Notes
- Registration page
- Reset password wizard
