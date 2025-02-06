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

namespace App\Common\Loggers;

use Monolog\Handler\AbstractProcessingHandler;
use Monolog\Handler\FormattableHandlerTrait;
use Monolog\Handler\SyslogUdp\UdpSocket;
use Monolog\Level;
use Monolog\LogRecord;

class SimpleUdpHandler extends AbstractProcessingHandler
{
    use FormattableHandlerTrait;

    protected UdpSocket $socket;

    public function __construct(
        protected string $prefix,
        string $host,
        int $port = 514,
        int|Level|string $level = Level::Debug,
        bool $bubble = true
    ) {
        parent::__construct($level, $bubble);
        $this->setSocket(new UdpSocket($host, $port));
    }

    public function getSocket(): UdpSocket
    {
        return $this->socket;
    }

    public function setSocket(UdpSocket $socket): void
    {
        $this->socket = $socket;
    }

    public function getPrefix(): string
    {
        return $this->prefix;
    }

    public function setPrefix(string $prefix): void
    {
        $this->prefix = $prefix;
    }

    protected function write(LogRecord $record): void
    {
        $channel = $record->channel; # 默认是 Log
        // format
        $header = sprintf(
            '%s%s,%s,',
            $this->getPrefix(),
            $channel,
            time()
        );
        $line = $this->getFormatter()->format($record);
        // udp send
        $this->socket->write($line, $header);
    }
}
