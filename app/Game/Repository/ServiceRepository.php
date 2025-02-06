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

namespace App\Game\Repository;

use GuzzleHttp\Client;
use Hyperf\Guzzle\ClientFactory;

class ServiceRepository
{
    protected string $serviceName = '';

    protected array $services = [];

    protected bool $debug = true;

    private Client $client;

    public function __construct(
        ClientFactory $clientFactory,
    )
    {
        $this->services = [
            'games' => env('GAMES_SERVER', 'localhost'),
            'live' => env('LIVE_SERVER', 'localhost'),
        ];
        $this->client = $clientFactory->create([
            'base_uri' => $this->services[$this->serviceName],
            'timeout' => 10.0,
        ]);
    }

    public function request(string $uri, array $data = []): array
    {
        $response = $this->client->post('/api/v0?auth=' . env("AUTH"), [
            'json' => [
                'model' => explode('/', $uri)[0],
                'function' => explode('/', $uri)[1],
                'parameters' => $data,
            ],
        ]);
        if ($response->getStatusCode() !== 200) {
            throw new \RuntimeException("返回code非success" . json_encode([
                $response->getStatusCode(),
                $response->getBody()
             ]));
        }
        $result = json_decode($response->getBody()->getContents(), true);
        if (json_last_error() !== JSON_ERROR_NONE) {
            throw new \RuntimeException('调用接口【' . $uri . '】报错:返回的内容非json格式：(' . json_encode([
                $response->getStatusCode(),
                $response->getBody(),
                $result]) . ')');
        }
        return $result;

    }
}
