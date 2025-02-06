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

class NumService
{
    #[Inject]
    public LiveRepository $serviceRepository;

    private string $errMsg = '';

    public function getErrMsg(): string
    {
        return $this->errMsg;
    }

    public function getGameList()
    {
        return $this->serviceRepository->request('game_conf/getGameList') ?? [];
    }

    public function getGameRecords($bout, $page, $pagesize, $btime, $etime)
    {
        return $this->serviceRepository->request('num_game/getGameRecords', [$bout, $page, $pagesize, $btime, $etime])['data'] ?? [];
    }

    public function getHistoryData()
    {
        return $this->serviceRepository->request('game_conf/getHistoryData') ?? [];
    }

    public function updateConf($id, $data)
    {
        $this->errMsg = '';
        return $this->serviceRepository->request('game_conf/updateConf', [$id, $data]) ?? [];
    }
}
