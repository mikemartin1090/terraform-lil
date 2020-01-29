I've been told to break this out into two repositories - one for modules and one for the 'live' code.

- Modules is where we keep things that will be re-used, such as a web service cluster (ALB, Security Groups, etc.). These accept variables, some optional and some required.

- Live contains all of the variables that we will feed to a module.
