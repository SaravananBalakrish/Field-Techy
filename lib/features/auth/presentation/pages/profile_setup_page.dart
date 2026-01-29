import 'package:field_techy/core/widgets/gradient_button.dart';
import 'package:field_techy/features/auth/utils/profile_validator.dart';
import 'package:flutter/material.dart';

enum ClientType { home, corporate }

class ProfileSetupPage extends StatefulWidget {
  const ProfileSetupPage({super.key});

  @override
  State<ProfileSetupPage> createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final _formKey = GlobalKey<FormState>();
  ClientType _selectedClient = ClientType.home;
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _Header(),
                const SizedBox(height: 24),
                _ClientTypeSelector(
                  selectedClient: _selectedClient,
                  onSelectionChanged: (newSelection) {
                    setState(() {
                      _selectedClient = newSelection.first;
                    });
                  },
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (_selectedClient == ClientType.corporate)
                          const _CorporateClientFields()
                        else
                          const _HomeClientFields(),
                        const _CommonFields(),
                        if (_selectedClient == ClientType.corporate)
                          const _CorporateSpecificFields(),
                        _PasswordFields(passwordController: _passwordController),
                      ],
                    ),
                  ),
                ),
                GradientButton(
                  text: 'Save and Continue',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, proceed
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Text(
          'Profile Setup',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Complete your profile to unlock opportunities.',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _ClientTypeSelector extends StatelessWidget {
  final ClientType selectedClient;
  final Function(Set<ClientType>) onSelectionChanged;

  const _ClientTypeSelector({
    required this.selectedClient,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<ClientType>(
      segments: const <ButtonSegment<ClientType>>[
        ButtonSegment<ClientType>(
          value: ClientType.home,
          label: Text('Home Client'),
        ),
        ButtonSegment<ClientType>(
          value: ClientType.corporate,
          label: Text('Corporate Client'),
        ),
      ],
      selected: {selectedClient},
      onSelectionChanged: onSelectionChanged,
    );
  }
}

class _HomeClientFields extends StatelessWidget {
  const _HomeClientFields();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Full Name *'),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Full Name',
            prefixIcon: Icon(Icons.person_outline),
          ),
          validator: ProfileValidator.validateFullName,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _CorporateClientFields extends StatelessWidget {
  const _CorporateClientFields();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Company Name *'),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Company Name',
            prefixIcon: Icon(Icons.business),
          ),
          validator: ProfileValidator.validateCompanyName,
        ),
        const SizedBox(height: 16),
        const Text('Contact Person Name *'),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Contact Person Name',
            prefixIcon: Icon(Icons.person_outline),
          ),
          validator: ProfileValidator.validateContactPersonName,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _CommonFields extends StatelessWidget {
  const _CommonFields();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Phone Number *'),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Enter mobile number',
            prefixIcon: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('+91'),
            ),
          ),
          validator: ProfileValidator.validatePhoneNumber,
        ),
        const SizedBox(height: 16),
        const Text('Email Address *'),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Email Address',
            prefixIcon: Icon(Icons.email_outlined),
          ),
          validator: ProfileValidator.validateEmail,
        ),
        const SizedBox(height: 16),
        const Text('Country *'),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            hintText: 'Select Country',
          ),
          items: const [],
          onChanged: (value) {},
          validator: ProfileValidator.validateCountry,
        ),
        const SizedBox(height: 16),
        const Text('State *'),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            hintText: 'Select State',
          ),
          items: const [],
          onChanged: (value) {},
          validator: ProfileValidator.validateState,
        ),
        const SizedBox(height: 16),
        const Text('City *'),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            hintText: 'Select City',
          ),
          items: const [],
          onChanged: (value) {},
          validator: ProfileValidator.validateCity,
        ),
        const SizedBox(height: 16),
        const Text('Postal Code *'),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Postal Code',
          ),
          validator: ProfileValidator.validatePostalCode,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _CorporateSpecificFields extends StatelessWidget {
  const _CorporateSpecificFields();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Address *'),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Address',
          ),
          validator: ProfileValidator.validateAddress,
        ),
        const SizedBox(height: 16),
        const Text('VAT *'),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            hintText: 'Select VAT Document',
          ),
          items: const [],
          onChanged: (value) {},
          validator: ProfileValidator.validateVatDocument,
        ),
        const SizedBox(height: 16),
        const Text('VAT Registration Number *'),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'VAT Registration Number',
          ),
          validator: ProfileValidator.validateVatNumber,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _PasswordFields extends StatelessWidget {
  final TextEditingController passwordController;
  const _PasswordFields({required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Password *'),
        const SizedBox(height: 8),
        TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Password',
            suffixIcon: Icon(Icons.visibility),
          ),
          validator: ProfileValidator.validatePassword,
        ),
        const SizedBox(height: 16),
        Text('Confirm Password *'),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Password',
            suffixIcon: Icon(Icons.visibility),
          ),
          validator: (value) => ProfileValidator.validateConfirmPassword(value, passwordController.text),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
