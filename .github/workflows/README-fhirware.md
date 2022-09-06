# About
This directory contains GitHub Actions configuration to build one or more IGs under the `ig` folder. Better documentation will be added soon but the goals of this Actions configuration is the following:

* Choose which IGs to build
* Choose which branch(s) is the branch into which development branches (feature, PR, etc.) are merged.
  * This branch is built on a push, which includes merging a PR.
* Allow and build PRs from same repository or from forks.
  * Such PR branches are possibly built twice. First, the HEAD of the PR's branch is built. Then, if the HEAD can be merged into the base branch, and the merge is not a simple fast-forward, the merge is done, built, and then discarded, to be able to test if the merge can be successfully built.
* Publish the results of all of the above builds to a dedicated "publishing" repository.
  * This GH repository is configurable along with the branch that will be used for publishing the static sites for each of the above builds.
  * If the branch is a ghpages branch, GitHub will make these static pages available for browsing.
  * There will be an `IG_BUILD.md` file in this repository that lists the available build results. [See this](https://github.com/ShahimEssaid/tmp-io/blob/gh-pages/IG_BUILDS.md) for an example of how this works until additional documentation is available.
* Basically, the goal is to allow various branches and their PRs to be built and published through GitHub tools to allow easier collaboration and review of the results before merging. PRs are constantly rebuilt as changes occur on the PRs.

## Implementation outline

* A reusable `ig-build.yml` that builds an IG
  * It takes several parameters to allow this workflow to be reusable for each IG. See some parameter documentation in the file.
* An IG specific workflow file (one per GI) that is responsible for defining the triggering events, calculates the arguments needed for the reusable workflow, and then calls it.
  * The two example workflows are turned off by suffixing the workflow file with `.off`. Examine, copy, and enable as needed to build a specific IG. More documentatin to come.
  * 