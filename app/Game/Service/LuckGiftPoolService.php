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

namespace App\Game\Service;

use App\Game\Repository\GamesRepository;
use Hyperf\Di\Annotation\Inject;

/**
 * 数据源管理服务类.
 */
class LuckGiftPoolService
{
    #[Inject]
    public GamesRepository $serviceGamesRepository;

    private string $errMsg = '';

    public function getErrMsg(): string
    {
        return $this->errMsg;
    }

    public function getLuckGiftPoolCycle()
    {
        return $this->serviceGamesRepository->request('luck_gift_pool/getLuckGiftPoolCycle')['data']['list'] ?? [];
    }

    public function getLuckGiftPoolGifts()
    {
        return $this->serviceGamesRepository->request('luck_gift_pool/getLuckGiftPoolGifts')['data']['list'] ?? [];
    }

    /**
     * @param mixed $id
     */
    public function getLuckGiftPoolInfo($id)
    {
        return $this->serviceGamesRepository->request('luck_gift_pool/getLuckGiftPoolInfo', [$id])['data'] ?? [];
    }

    public function getPoolConf()
    {
        return $this->serviceGamesRepository->request('luck_gift_pool/getPoolConf')['data'] ?? [];
    }

    public function updatePoolConf($items)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('luck_gift_pool/updatePoolConf', [$items]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function addLuckGiftPoolGift($id)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('luck_gift_pool/addLuckGiftPoolGift', [$id]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function mdLuckGiftPoolGift($id, $post)
    {
        return $this->serviceGamesRepository->request('luck_gift_pool/mdLuckGiftPoolGift', [$id, $post])['data'] ?? [];
    }

    public function luckGiftPoolGiftPutAway($id, $queueState)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('luck_gift_pool/putAway', [$id, $queueState]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function mdfLuckGiftPoolCycle($id, $post)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('luck_gift_pool/mdfLuckGiftPoolCycle', [$id, $post]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }
}
