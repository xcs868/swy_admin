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

namespace App\Game\Controller\LuckGift;

use App\Game\Service\LuckGiftPoolService;
use Hyperf\Di\Annotation\Inject;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\GetMapping;
use Hyperf\HttpServer\Annotation\PutMapping;
use Mine\MineController;
use Mine\MineFormRequest;
use Psr\Http\Message\ResponseInterface;

#[Controller(prefix: 'game/luck-gift/jackpot-pool-config')]
class LuckGiftJackpotPoolConfigController extends MineController
{
    #[Inject]
    protected LuckGiftPoolService $service;

    #[GetMapping('list')]
    public function list(): ResponseInterface
    {
        return $this->success($this->service->getPoolConf());
    }

    #[PutMapping('update')]
    public function updatePoolConfig(MineFormRequest $request): ResponseInterface
    {
        $postData = $request->all() ?? [];
        $items = [];
        foreach ($postData['data'] as $key => $postDatum) {
            $items[] = [
                'id' => $key,
                'data' => $postDatum,
            ];
        }
        return $this->service->updatePoolConf($items) ? $this->success() : $this->error($this->service->getErrMsg());
    }
}
