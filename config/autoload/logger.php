<?php

declare(strict_types=1);
/**
 * This file is part of MineAdmin.
 *
 * @link     https://www.mineadmin.com
 * @document https://doc.mineadmin.com
 * @contact  root@imoi.cn
 * @license  https://github.com/mineadmin/MineAdmin/blob/master/LICENSE
 */
use App\Common\Loggers\SimpleUdpHandler;
use Mine\Log\Processor\UuidRequestIdProcessor;
use Monolog\Formatter\LineFormatter;
use Monolog\Handler\RotatingFileHandler;
use Monolog\Level;
use Monolog\Logger;

return [
    'default' => [
        'handler' => [
            'class' => SimpleUdpHandler::class,
            'constructor' => [
                'prefix' => env('LOG_UDP_PREFIX', 'mine_'),
                'host' => env('LOG_UDP_HOST', 'udp-server'),
                'port' => (int) env('LOG_UDP_PORT', 8010),
                'level' => env('LOG_UDP_LEVEL', 'debug'),
            ],
        ],
        'formatter' => [
            'class' => LineFormatter::class,
            'constructor' => [
                'format' => '%level_name%: %message% %context% %extra%',
                'dateFormat' => 'Y-m-d H:i:s',
                'allowInlineLineBreaks' => true,
            ],
        ],
        'processor' => [
            'class' => UuidRequestIdProcessor::class,
        ],
    ],
    //    'default' => [
    //        'handler' => [
    //            'class' => RotatingFileHandler::class,
    //            'constructor' => [
    //                'filename' => BASE_PATH . '/runtime/logs/debug/mine.log',
    //                'level' => Logger::DEBUG,
    //            ],
    //        ],
    //        'formatter' => [
    //            'class' => LineFormatter::class,
    //            'constructor' => [
    //                'format' => null,
    //                'dateFormat' => 'Y-m-d H:i:s',
    //                'allowInlineLineBreaks' => true,
    //            ],
    //        ],
    //        'processor' => [
    //            'class' => UuidRequestIdProcessor::class,
    //        ],
    //    ],
    'sql' => [
        'handler' => [
            'class' => RotatingFileHandler::class,
            'constructor' => [
                'filename' => BASE_PATH . '/runtime/logs/sql/sql.log',
                'level' => Logger::DEBUG,
            ],
        ],
        'formatter' => [
            'class' => LineFormatter::class,
            'constructor' => [
                'format' => null,
                'dateFormat' => 'Y-m-d H:i:s',
                'allowInlineLineBreaks' => true,
            ],
        ],
        'processor' => [
            'class' => UuidRequestIdProcessor::class,
        ],
    ],
];
