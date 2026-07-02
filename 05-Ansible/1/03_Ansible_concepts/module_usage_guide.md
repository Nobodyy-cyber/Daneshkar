** ansible-doc **

Run `ansible-doc -l` to list all modules, or `ansible-doc <module_name>` (e.g., `ansible-doc copy`) to view detailed documentation,
including descriptions, options, and examples directly in your terminal.

**Find examples**
Scroll to the bottom of the module's documentation output from `ansible-doc <module_name>`,
where you'll find an "EXAMPLES" section that shows real working playbook snippets for common use cases

**Understand parameters** Read the "OPTIONS" or "PARAMETERS" section in the output, which lists each parameter's name,
data type (string/bool/list), whether it's required, default values, and a description of its purpose—focus on `required: true`
and alias names to grasp essential usage.
