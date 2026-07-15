<?php

$config = [
    'defaultIncludes' => [],
];

$dir = realpath(getcwd());

if (file_exists(sprintf('%s/composer.json', $dir)) && file_exists(sprintf('%s/vendor/autoload.php', $dir))) {
    if (is_readable(sprintf('%s/vendor/autoload.php', $dir))) {
        $config['defaultIncludes'][] = sprintf('%s/vendor/autoload.php', $dir);
    }
}

return $config;
