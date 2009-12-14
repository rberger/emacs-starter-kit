# My Fork of the Emacs Starter Kit

This is Mudphone's RUNA fork of the Emacs Starter Kit (by Technomancy).
See README_orig.markdown for the basics.  Or, checkout the
  [original project page](http://github.com/technomancy/emacs-starter-kit
  "Technomancy's Emacs Starter Kit on Github").


## Installation

1. Clone or fork this project.

     Forking is easier, as it will automatically create a github project for you
     (and you'll show up in the network graph).


2. Create a .emacs.d link to this project.

     For example, if you forked and cloned the project as:

         $ cd ~/work/emacs
         $ git clone git://github.com/<your user name>/emacs-starter-kit.git

     If you already have a .emacs.d directory, you should rename it
     (unless you don't want it any more).

     Then, you can create your link like so:

         $ cd ~/.
         $ ln -s ~/work/emacs/emacs-starter-kit .emacs.d


3. Update ELPA Packages

     M-x package-list-packages
     i - next to each package you want

     * Recommended non-default packages:
       - clojure-mode
       - clojure-test-mode
       - magit
       - rinari
       - yasnippet-bundle

     * Automatically installed by the above modes:
       - slime
       - slime-repl
       - swank-clojure

     * Note: It is not required to install paredit here.


4. Refresh all submodules

     You must refresh all submodules:

         $ cd ~/.emacs.d
         $ git submodule init
         $ git submodule update


## Feature Highlights

### SUBMODULES

- RSpec-Mode: vendor/rspec-mode (submodule)
  allows for single spec or whole file spec running

        (define-key map (kbd "\C-c s") 'run-specs)
        (define-key map (kbd "\C-c f") 'run-focused-spec)

### MUDPHONE'S CUSTOMIZATIONS

- Runa: vendor/mudphone/runa.el
  customized RUNA keyword syntax highlighting

- Maxframe: vendor/mudphone/maxframe.el
  maximizes emacs frame on start-up

- Textmate: vendor/mudphone/textmate.el
  several Textmate feature emulations

        (define-key map [(meta return)] 'textmate-next-line)
        (define-key map [(control tab)] 'textmate-shift-right)
        (define-key map [(control shift tab)] 'textmate-shift-left)
        (define-key map [(control meta \;)]
                        'comment-or-uncomment-region-or-line)
        (define-key map [(meta t)] 'textmate-goto-file)

### TODO

#### Instructions for using customizations:

##### ERC:
  * .authinfo.template
  * .erc-auth.
  * ercrc.el

##### EShell:
  * eshell-customizations.el

##### Gnus (for Gmail):
  * .gnus.el.template

#### In the meantime, check the comments at the top of these files for info.


Happy hacking!!!


