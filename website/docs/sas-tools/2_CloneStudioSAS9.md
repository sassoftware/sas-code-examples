---
sidebar_position: 2
---
# Using the Repository with SAS Studio on SAS 9
## Create a forked copy of sas-code-examples
1.	If you do not have a profile in GitHub, visit [https://github.com/signup](https://github.com/signup). Create an account with your email and a username of your choice. 
2.	Access the public [sas-code-examples repository](https://github.com/sassoftware/sas-code-examples).
3.	Click the down arrow next to **Fork** and select **Create a new fork**. 
4.	It may be helpful to add a prefix to the repository name to distinguish it from the main repository, for example: `name-sas-code-examples`. The branch name cannot include spaces. Click **Create fork**.
5.	Confirm you are working in your branch, which is a personal copy of the repository.

## Create a Git Profile in SAS Studio
1. Open SAS Studio. If you do not see Git Repository in the left pane, click (**More application options**) and select View > Git Repository. 
2. From the Git Repository pane, click **Create a Profile**. 
3. Provide a profile name of your choice. Enter the user name and email associated with your GitHub profile. Browse to select your public and private SSH keys for authentication. See [Creating a Git Profile](https://go.documentation.sas.com/doc/en/webeditorcdc/3.8/webeditorug/p1aoidfxzol1fgn15xobcl43caho.htm) for details. 
:::tip

To view a demonstration of how to create and configure SSH keys with GitHub and SAS Studio, view [Git Integration with SAS Studio](https://video.sas.com/detail/videos/sas-viya-quick-start/video/6358959868112/git-integration-with-sas-studio?autoStart=true).

:::

## Clone the repository in SAS Studio
1.	In your forked repository on GitHub.com, select the green **Code** button. On the **Local** tab, select **SSH**. Click <img width="12" height="14" alt="Copy (2)" src="https://github.com/user-attachments/assets/18939792-199e-4bf5-aaa9-7d888cee73fe" /> (**Copy**) to copy the repository reference.
2.	Return to SAS Studio. IN the Git Repository pane, click **Clone a Repository**. Navigate to a location with write access, then right-click the folder and select **New folder**. Name the folder `sas-code-examples` and click **OK**.
3.	Select <img width="12" height="14" alt="GitRepository" src="https://github.com/user-attachments/assets/521a9569-1a6f-48fc-b48e-7ac0ce1470d1" /> (**Git Repositories**) in the left pane and click **Clone**.
4.	Paste the repository URL copied previously from GitHub. Next, click **Browse**. Create a new folder named `sas-code-examples` in a location of your choice. Select the new `sas-code-examples` folder and click **OK**. 
5.	`sas-code-examples` is now listed in the Git Repositories pane, and a new tab opens. You can also double click the repository name in the left pane to open it. This is where you can view the staged and unstaged changes in your local repository and pull or push changes to the external Git repository.

## Create/modify programs and update personal repository
1.	In SAS Studio, click <img width="12" height="14" alt="Server" src="https://github.com/user-attachments/assets/2372856a-165c-48c6-90d0-b96c069c1c48" /> in the left pane to open the **Explorer** or **SAS Server**. Navigate to `sas-code-examples` folder where you cloned your personal forked version of the repository. 
2.	You can open existing programs, make modifications, and save changes – just as you would any other local files. You can also add new programs. Any changes you make are saved only in your local repository. 
3.	Select <img width="12" height="14" alt="GitRepository" src="https://github.com/user-attachments/assets/0fec2580-827d-475d-87dc-23ec269d124f" /> (**Git Repositories**) and double-click `sas-code-examples` to open the repository in a tab. Any programs that have been modified or created will be listed in the _Unstaged Changes_ list. Select one or more programs from the list and use the down arrow icons to move them to the _Staged Changes_.
4.	View the program on the right to examine highlighted portions of the code that have been added or removed. 
5.	Type a message in the **Commit Comment** box that describes the modifications made to the program(s), then click **Commit**.

:::tip

It is a good practice to stage one program at a time to provide an appropriate comment for the new commit. Only commit multiple programs at once if a single comment applies to all changes.

:::

6.	Click **Push Main** to push the commits to your personal remote repository in GitHub. 
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
3.	In SAS Studio, select <img width="12" height="14" alt="GitRepository" src="https://github.com/user-attachments/assets/6aad0af8-65ca-452c-b96f-7d8886a030ad" /> (**Git Repositories**) and open your cloned `sas-code-examples` repository. Then click **Pull** to sync your local files with the remote repository. 

