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

use App\Game\Service\LuckGiftJackpotRankService;
use Hyperf\Di\Annotation\Inject;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\DeleteMapping;
use Hyperf\HttpServer\Annotation\GetMapping;
use Hyperf\HttpServer\Annotation\PutMapping;
use Mine\MineController;
use Mine\MineFormRequest;
use Psr\Http\Message\ResponseInterface;

#[Controller(prefix: 'game/luck-gift/jackpot-rank')]
class JackpotRankController extends MineController
{
    #[Inject]
    protected LuckGiftJackpotRankService $service;

    #[GetMapping('list')]
    public function list(MineFormRequest $request): ResponseInterface
    {
        $postData = $request->all() ?? [];
        $uid = $postData['uid'];
        $uid = empty($uid) ? 0 : $uid;
        if ($uid != 0) {
            if (! $this->service->getByUids($uid)) {
                return $this->error('用户不存在');
            }
        }
        return $this->success($this->service->getLuckGiftPoolRank($uid));
    }

    #[DeleteMapping('delete')]
    public function delLuckGiftPoolRankByUid(MineFormRequest $request): ResponseInterface
    {
        $postData = $request->all() ?? [];
        $uid = $postData['uid'];
        $uid = empty($uid) ? 0 : $uid;
        return $this->service->delLuckGiftPoolRankByUid($uid) ? $this->success() : $this->error($this->service->getErrMsg());
    }

    #[PutMapping('update')]
    public function mdLuckGiftPoolRankByAllUser(MineFormRequest $request): ResponseInterface
    {
        $postData = $request->all() ?? [];
        $items = [];
        foreach ($postData['form'] as $key => $postDatum) {
            $items[] = [
                'id' => $key,
                'data' => $postDatum,
            ];
        }
        return $this->service->mdLuckGiftPoolRankByAllUser($items) ? $this->success() : $this->error($this->service->getErrMsg());
    }

    #[PutMapping('update/tax')]
    public function mdLuckGiftPoolUserTax(MineFormRequest $request): ResponseInterface
    {
        $postData = $request->all() ?? [];

        $uid = $postData['uid'];
        $tax = $postData['tax'];

        $this->service->mdLuckGiftPoolTax($tax['value']);
        if (! empty($uid)) {
            if ($uid != 0) {
                if (! $this->service->getByUids($uid)) {
                    return $this->error('用户不存在');
                }
            }
            $this->service->mdLuckGiftPoolUserTax($uid, $tax['user_tax']);
        }

        return $this->service->mdSingleLuckGiftPoolTax($tax['value']) ? $this->success() : $this->error($this->service->getErrMsg());
    }

    #[PutMapping('update/{uid}')]
    public function mdLuckGiftPoolRankByUid(MineFormRequest $request): ResponseInterface
    {
        $postData = $request->all() ?? [];
        $uid = $postData['uid'];
        if ($uid != 0) {
            if (! $this->service->getByUids($uid)) {
                return $this->error('用户不存在');
            }
        }
        $items = [];
        foreach ($postData['form'] as $key => $postDatum) {
            $items[] = [
                'uid' => $uid,
                'id' => $key,
                'data' => $postDatum,
            ];
        }
        return $this->service->mdLuckGiftPoolRankByUid($items) ? $this->success() : $this->error($this->service->getErrMsg());
    }
}
