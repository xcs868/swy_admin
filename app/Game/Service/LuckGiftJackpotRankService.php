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
class LuckGiftJackpotRankService
{
    #[Inject]
    public GamesRepository $serviceGamesRepository;

    private string $errMsg = '';

    public function getErrMsg(): string
    {
        return $this->errMsg;
    }

    public function getUserRankAllUsers($uid)
    {
        return $this->serviceGamesRepository->request('luck_gift_pool/getUserRankAllUsers', [$uid])['data'] ?? [];
    }

    public function getLuckGiftPoolRank($uid)
    {
        return $this->serviceGamesRepository->request('luck_gift_pool/getLuckGiftPoolRank', [$uid])['data'] ?? [];
    }

    public function getByUids($uid)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('luck_gift_pool/getByUids', [$uid]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function delLuckGiftPoolRankByUid($uid)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('luck_gift_pool/delLuckGiftPoolRankByUid', [$uid]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function mdLuckGiftPoolRankByAllUser($items)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('luck_gift_pool/mdLuckGiftPoolRankByAllUser', [$items]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function mdLuckGiftPoolRankByUid($items)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('luck_gift_pool/mdLuckGiftPoolRankByUid', [$items]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function mdLuckGiftPoolUserTax($uid, $tax)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('luck_gift_pool/mdLuckGiftPoolUserTax', [$uid, $tax]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function mdSingleLuckGiftPoolTax($userTax)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('luck_gift_pool_single/mdLuckGiftPoolTax', [$userTax]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }

    public function mdLuckGiftPoolTax($userTax)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceGamesRepository->request('luck_gift_pool/mdLuckGiftPoolTax', [$userTax]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }
}
