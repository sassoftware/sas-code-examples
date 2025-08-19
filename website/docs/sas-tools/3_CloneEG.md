---
sidebar_position: 3
---
# Using the Repository with SAS Enterprise Guide
## Create a forked copy of sas-code-examples
1.	If you do not have a profile in GitHub, visit [https://github.com/signup](https://github.com/signup). Create an account with your email and a username of your choice. 
2.	Access the public [sas-code-examples repository](https://github.com/sassoftware/sas-code-examples).
3.	Click the down arrow next to **Fork** and select **Create a new fork**. 
4.	It may be helpful to add a prefix to the repository name to distinguish it from the main repository, for example: `name-sas-code-examples`. The branch name cannot include spaces. Click **Create fork**.
5.	Confirm you are working in your branch, which is a personal copy of the repository.

## Create a Git Profile in SAS Enterprise Guide
1.	In Enterprise Guide, select **Tools** > **Manage Git connections** > **Profiles** > **+** (**Add**).
2.	Enter the following information, then click **OK** > **Close**. 
- **Profile name**: _enter a name of your choice_
- **User name**: _your GitHub profile name_
- **Email**: _your email address_
- **Password**: _your GitHub password_

## Clone the repository in SAS Enterprise Guide
1.	In your forked repository on GitHub.com, select the green **Code** button. On the **Local** tab, verify the **HTTPS** tab is selected. Click <img width="12" height="14" alt="Copy (2)" src="https://github.com/user-attachments/assets/18939792-199e-4bf5-aaa9-7d888cee73fe" /> (**Copy**) to copy the repository reference.
2.	Return to Enterprise Guide. Select <img width="12" height="14" alt="GitRepository" src="https://github.com/user-attachments/assets/521a9569-1a6f-48fc-b48e-7ac0ce1470d1" /> (**Git Repositories**) in the left pane and click **Clone**.
4.	Paste the repository URL copied previously from GitHub. Next, click <img width="14" height="12" alt="Folder" src="https://github.com/user-attachments/assets/5fc761e6-1ff4-4f82-8dec-210c3e829e7b" />. Create a new folder named `sas-code-examples` to store your local copy of the repository.
5. Verify your GitHub profile is selected, then click **Clone**.
6. `sas-code-examples` is now listed in the Git Repositories pane, and a new tab opens. You can also double-click the repository name in the left pane to open it. This is where you can view the staged and unstaged changes in your local repository and pull or push changes to your remote forked repository.

## Create/modify programs and update personal repository
1.	In the Servers list in Enterprise Guide, navigate to the `sas-code-examples` folder where you cloned your forked version of the repository. 
2.	You can open existing programs, make modifications, and save changes – just as you would any other local files. You can also add new programs. Any changes you make are saved only in your local repository. 
3.	Select <img width="12" height="14" alt="GitRepository" src="https://github.com/user-attachments/assets/0fec2580-827d-475d-87dc-23ec269d124f" /> (**Git Repositories**) and double-click `sas-code-examples` to open the repository in a tab. Any programs that have been modified or created will be listed in the _Unstaged Changes_ list. Select one or more programs from the list and use the down arrow icons to move them to the _Staged Changes_.
4.	View the program on the right to examine highlighted portions of the code that have been added or removed. 
5.	Type a message in the **Commit Comment** box that describes the modifications made to the program(s), then click **Commit**.

:::tip

It is a good practice to stage one program at a time to provide an appropriate comment for the new commit. Only commit multiple programs at once if a single comment applies to all changes.

:::

6.	Click **Push** to push the commits to your personal remote repository in GitHub. 
7.	Return to your forked copy of the repository on GitHub.com and refresh the page to verify the changes have been synced. 

## Merge changes into public repository 
At any point you can request to merge your personal repository changes with the official public repository. In GitHub, this is called a Pull Request (PR).
1.	Refresh the GitHub page for your personal forked repository. The following message indicates that you have updates in your branch that are not year in the public repository. <img width="758" height="100" alt="image" src="https://github.com/user-attachments/assets/15299b74-3db3-4283-a4e7-728ca899647f" />
1.	Select **Contribute** > **Open pull request**.
2.	You may provide a description to explain the changes made. Your request will be reviewed to verify all contribution rules are followed and that there are no conflicts with other updates.

:::warning

Your contribution must meet the project's contribution guidelines. See `CONTRIBUTING.md` for details. The last line in the PR description must be the following text: `Signed-off-by: Name <email.address>`.

:::

3.	Click **Create pull request**. You will likely see the following message, which can be ignored: <img width="509" height="198" alt="image" src="https://github.com/user-attachments/assets/73d765b2-b15d-450f-97ef-d9223a2c97bd" />
4.	The PR will go to the repository maintainers for approval. If there are issues with your requested changes, you may be asked in the comments of the PR to make further edits and recommit your file(s). 
5.	Once all changes are approved, they will be merged into the main repository. You will see the following message in your PR: <img width="561" height="144" alt="image" src="https://github.com/user-attachments/assets/e41b8172-9397-49f4-8acd-7a090e32aefb" />

## Keep personal fork in sync with main project repository
:::tip

You can continue to work with the same personal fork of the repository for future updates; however, it is very important to keep it in sync with the main project repository. This will help to avoid conflicts when making pull requests.

:::

1.	In GitHub.com, check your branch for the following message that indicates there are updates in the public repository that have not been synced with your branch: <img width="737" height="94" alt="image" src="https://github.com/user-attachments/assets/6d54920f-8b14-41be-83c9-40ca98ad7925" />
2.	Click **Sync fork** > **Update branch**. This will update your branch stored in GitHub. 
3.	In Enterprise Guide, select <img width="12" height="14" alt="GitRepository" src="https://github.com/user-attachments/assets/6aad0af8-65ca-452c-b96f-7d8886a030ad" /> (**Git Repositories**) and open your cloned `sas-code-examples` repository. Then click **Pull** to sync your local files with the remote repository. 
