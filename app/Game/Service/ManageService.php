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

class ManageService
{
    #[Inject]
    public LiveRepository $serviceRepository;

    private string $errMsg = '';

    public function getErrMsg(): string
    {
        return $this->errMsg;
    }

    public function openManage()
    {
        return $this->serviceRepository->request('game_conf/openManage')['data'] ?? [];
    }

    public function changeArea($id, $area, $isOpen)
    {
        $this->errMsg = '';
        $serviceRet = $this->serviceRepository->request('game_conf/changeArea', [$id, $area, $isOpen]) ?? [];
        if ($serviceRet['code'] != 1) {
            $this->errMsg = $serviceRet['msg'] ?? '';
            return false;
        }
        return true;
    }
}
