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

use App\Game\Repository\LiveRepository;
use Hyperf\Di\Annotation\Inject;

class LuckGiftBasicCfgService
{
    #[Inject]
    public LiveRepository $serviceRepository;

    private string $errMsg = '';

    public function getErrMsg(): string
    {
        return $this->errMsg;
    }

    public function list()
    {
        return $this->serviceRepository->request('luckGift/getBasicCfg')['data']['list'] ?? [];
    }

    public function getLevel2LuckGift()
    {
        return $this->serviceRepository->request('luckGift/getLevel2LuckGift')['data'] ?? [];
    }

    public function getLevel3LuckGift()
    {
        return $this->serviceRepository->request('luckGift/getLevel3LuckGift')['data'] ?? [];
    }

    public function getLuckGiftMergeConfigs()
    {
        return $this->serviceRepository->request('luckGift/getLuckGiftMergeConfigs')['data'] ?? [];
    }

    public function mdfBasicCfg($id, $post)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceRepository->request('luckGift/mdfBasicCfg', [$post, $id]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function batchUpdatePrize($post)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceRepository->request('luckGift/batchUpdatePrize', [$post]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function batchUpdatePrize3($post)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceRepository->request('luckGift/batchUpdatePrize3', [$post]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function updateLuckGiftMergeConfigs($id, $post)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceRepository->request('luckGift/updateLuckGiftMergeConfigs', [$id, $post]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }
}
