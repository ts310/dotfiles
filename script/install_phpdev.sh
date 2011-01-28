#!/bin/bash

# Install local pear
pear config-create .pearrc
pear install -o PEAR

# Installing phpmd
pear channel-discover pear.phpmd.org
pear channel-discover pear.pdepend.org
pear install --alldeps phpmd/PHP_PMD-alpha

# Installing PHPUnit3
pear channel-discover pear.phpunit.de
pear channel-discover components.ez.no
pear channel-discover pear.symfony-project.com
pear install --alldeps phpunit/PHPUnit

# Installing Ethna
pear channel-discover pear.ethna.jp
pear install --alldeps ethna/ethna
