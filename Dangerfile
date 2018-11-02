# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
declared_trivial = github.pr_title.include? "#trivial"

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 500


# Don't let testing shortcuts get into master by accident
fail("fdescribe left in tests") if `grep -r fdescribe specs/ `.length > 1
fail("fit left in tests") if `grep -r fit specs/ `.length > 1

# Warn when library files has been updated but not tests.
has_app_changes = !git.modified_files.grep(/Natty/).empty?
tests_updated = !git.modified_files.grep(/NattyTest/).empty?
ui_tests_updated = !git.modified_files.grep(/NattyUITest/).empty?

if has_app_changes
  message "Project has app changes."
end
if tests_updated
  message "Project test were updated."
end
if ui_tests_updated
  message "Project UI test were changes."
end

if has_app_changes && (!tests_updated && !ui_tests_updated)
  warn("The Project files were changed, but the tests remained unmodified. Consider updating or adding to the tests to match the Project changes.")
end

# Mainly to encourage writing up some reasoning about the PR, rather than just leaving a title.
if github.pr_body.length < 50
  warn("Please provide a more detailed summary in the Pull Request description")
end

# Request a CHANGELOG entry, and give an example
if !git.modified_files.include?('CHANGELOG.md') && has_app_changes
  fail("Please include a CHANGELOG entry to credit yourself! \nYou can find it at [CHANGELOG.md](https://github.com/kArteL/Natty/blob/master/CHANGELOG.md).", :sticky => false)
  markdown <<-MARKDOWN
Here's an example of your CHANGELOG entry:
```markdown
* #{github.pr_title}\s\s
  [#{github.pr_author}](https://github.com/#{github.pr_author})
  [#issue_number or task] Link:(https://github.com/CocoaPods/CocoaPods/issues/issue_number)
  [#Description] Lorem ipsum lorem ipsum
```
*note*: There are two invisible spaces after the entry's text.
MARKDOWN
end

# lint
swiftlint.lint_files
