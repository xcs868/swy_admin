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
use Hyperf\HttpServer\Annotation\PostMapping;
use Hyperf\HttpServer\Annotation\PutMapping;
use Mine\MineController;
use Mine\MineFormRequest;
use Psr\Http\Message\ResponseInterface;

#[Controller(prefix: 'game/luck-gift/jackpot-config')]
class LuckGiftJackpotConfigController extends MineController
{
    #[Inject]
    protected LuckGiftPoolService $service;

    #[GetMapping('list')]
    public function list(): ResponseInterface
    {
        return $this->success($this->service->getLuckGiftPoolGifts());
    }

    #[GetMapping('read/{id}')]
    public function info(int $id): ResponseInterface
    {
        return $this->success($this->service->getLuckGiftPoolInfo($id));
    }

    #[PostMapping('save')]
    public function addLuckGiftPoolGift(MineFormRequest $request): ResponseInterface
    {
        $datas = $request->all() ?? [];
        $id = $datas['id'];
        return $this->service->addLuckGiftPoolGift((int) $id) ? $this->success() : $this->error($this->service->getErrMsg());
    }

    #[PutMapping('update')]
    public function mdLuckGiftPoolGift(MineFormRequest $request): ResponseInterface
    {
        $postData = $request->all() ?? [];
        $form = $postData['form'];
        $id = $postData['id'];
        return $this->service->mdLuckGiftPoolGift((int) $id, $form) ? $this->success() : $this->error($this->service->getErrMsg());
    }

    #[PutMapping('put-away')]
    public function luckGiftPoolGiftPutAway(MineFormRequest $request): ResponseInterface
    {
        $params = $request->all();
        $configId = $params['config_id'];
        $queueStatus = $params['queue_status'];
        $queueState = $queueStatus == 1 ? 0 : 1;
        return $this->service->luckGiftPoolGiftPutAway((int) $configId, $queueState) ? $this->success() : $this->error($this->service->getErrMsg());
    }
}
