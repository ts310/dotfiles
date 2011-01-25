#!/usr/bin/php
<?php
class FFMPEG {

    private $ffmpeg = '/usr/local/bin/ffmpeg';

    public function dimension($video = null) {
        // echo $video . "\n";
        if (file_exists($video)) {
            $command = $this->ffmpeg . ' -i ' . $video . ' -vstats 2>&1';
            $output = shell_exec($command);
            // echo $output . "\n";
            $result = ereg ('[0-9]?[0-9][0-9][0-9]x[0-9][0-9][0-9][0-9]?', $output, $regs);
            if (isset ( $regs [0] )) {
                $vals = (explode ( 'x', $regs [0] ));
                $width = $vals [0] ? $vals [0] : null;
                $height = $vals [1] ? $vals [1] : null;
                return array ('width' => $width, 'height' => $height);
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
}

function debug($val = null) {
    print_r($val);
}

if (isset($argv[1])) {
    $ffmpeg = new FFMPEG;
    $size = $ffmpeg->dimension($argv[1]);
    debug($size);
} else {
    echo "Please provide video file path" . "\n";
}
?>
