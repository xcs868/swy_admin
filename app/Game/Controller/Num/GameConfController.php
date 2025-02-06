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

namespace App\Game\Controller\Num;

use App\Game\Service\NumService;
use Carbon\Carbon;
use Hyperf\Di\Annotation\Inject;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\GetMapping;
use Hyperf\HttpServer\Annotation\PutMapping;
use Mine\MineController;
use Mine\MineFormRequest;
use Psr\Container\ContainerExceptionInterface;
use Psr\Container\NotFoundExceptionInterface;
use Psr\Http\Message\ResponseInterface;

#[Controller(prefix: 'game/num')]
class GameConfController extends MineController
{
    #[Inject]
    protected NumService $service;

    #[GetMapping('index')]
    public function getGameRecordsList(MineFormRequest $request): ResponseInterface
    {
        $all = $request->all() ?? [];
        $page = $all['page'] ?? 1;
        $pagesize = $all['pageSize'] ?? 15;
        $bout = $all['bout'] ?? '';
        $btime = $all['start_date'] ?? Carbon::now()->startOfMonth()->toDateTimeString();
        $etime = $all['end_date'] ?? Carbon::now()->endOfDay()->toDateTimeString();

        $res = $this->service->getGameRecords($bout, $page, $pagesize, $btime, $etime);
        $count = $res['all_count'];
        foreach ($res['list'] as $index => $value) {
            $res['list'][$index]['bet_count'] = number_format((int) $value['bet_count']);
            $res['list'][$index]['bet_coins'] = number_format((int) $value['bet_coins']);
            $res['list'][$index]['lucky_num_str'] = array_sum(json_decode($value['lucky_num_str'], true));
            $res['list'][$index]['win_count'] = number_format((int) $value['win_count']);
            $res['list'][$index]['win_coins'] = number_format((int) $value['win_coins']);
            $res['list'][$index]['give_coins'] = number_format((int) $value['give_coins']);
            $res['list'][$index]['platform_coins'] = number_format((int) $value['platform_coins']);
            $res['list'][$index]['loss_amount'] = number_format((int) $value['bet_coins'] - (int) $value['win_coins']);
        }

        return $this->success([
            'items' => $res['list'],
            'pageInfo' => [
                'total' => (int) $count,
                'currentPage' => (int) $page,
                'totalPage' => ceil($count / $pagesize),
            ],
            'start_date' => $btime,
            'end_date' => $etime,
            'bout' => $bout,
        ]);
    }

    /**
     * 本地模块列表.
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[GetMapping('list')]
    public function list(): ResponseInterface
    {
        $gameList = $this->service->getGameList();
        $list = $gameList['data'];
        $data = [];
        $cheatCfg = [
            [
                'name' => 'spit_range',
                'range_start' => 502500001,
                'range_end' => 512500000,
                'rate' => 5,
                'all_bet_coins' => 50000,
                'odds_numerator' => 3,
                'odds_denominator' => 10,
            ],
            [
                'name' => 'normal_range',
                'range_start' => 497500001,
                'range_end' => 502500000,
                'rate' => 2,
                'all_bet_coins' => 30000,
                'odds_numerator' => 5,
                'odds_denominator' => 10,
            ],
            [
                'name' => 'suck_range',
                'range_start' => 487500001,
                'range_end' => 497500000,
                'rate' => 1,
                'all_bet_coins' => 10000,
                'odds_numerator' => 7,
                'odds_denominator' => 10,
            ],
            [
                'name' => 'ultra_range',
                'range_start' => 0,
                'range_end' => 487500000,
                'rate' => 1,
                'all_bet_coins' => 10000,
                'odds_numerator' => 10,
                'odds_denominator' => 10,
            ],
        ]; // fixme 仅初始化时使用，上线后修过一次后可以拿掉
        foreach ($list as $value) {
            $conf = json_decode($value['conf'], true);
            switch ($value['name']) {
                case 'numgame':
                    $data = $conf['assign_cfg'];
                    $data['cheat_cfg'] = $conf['cheat_cfg'] ?? $cheatCfg;
            }
        }

        $historyData = $this->service->getHistoryData()['data'] ?? [];
        $data = array_merge($data, $historyData);

        return $this->success($data);
    }

    /**
     * 更新数据.
     * @throws ContainerExceptionInterface
     * @throws NotFoundExceptionInterface
     */
    #[PutMapping('update')]
    public function update(MineFormRequest $request): ResponseInterface
    {
        try {
            $gameList = $this->service->getGameList();
            $list = $gameList['data'];

            $newList = $request->all()['lists'] ?? [];
            $newArr = [];
            foreach ($newList as $item) {
                $newArr[] = [
                    'name' => $item[0],
                    'range_start' => $item[1],
                    'range_end' => $item[2],
                    'rate' => $item[3],
                    'all_bet_coins' => $item[4],
                    'odds_numerator' => $item[5],
                    'odds_denominator' => 10,
                ];
            }

            foreach ($list as $listKey => $value) {
                if ($value['id'] == 1) { // 1是数字游戏的id
                    $conf = json_decode($value['conf'], true);
                    $cheatConf = &$conf['cheat_cfg'];
                    $cheatConf = $newArr;

                    $this->service->updateConf($value['id'], $conf);
                }
            }
        } catch (\Exception $exception) {
            return $this->error($exception->getMessage());
        }
        return $this->success();
    }

    #[PutMapping('change-basic-conf')]
    public function changeBasicConf(MineFormRequest $request): ResponseInterface
    {
        $gameList = $this->service->getGameList();
        $list = $gameList['data'];

        $postData = $request->all();
        $roomMaster = $postData['room_master'];
        $platform = $postData['platform'];
        $usermaxcoin = (int) $postData['usermaxcoin'];
        $shieldRate = $postData['shield_rate'];
        $highratefix = $postData['highratefix'];
        foreach ($list as $listKey => $value) {
            if ($value['name'] == 'numgame') {
                $conf = json_decode($value['conf'], true);
                $conf['assign_cfg'] = array_merge($conf['assign_cfg'], [
                    'room_master' => $roomMaster / 100,
                    'platform' => $platform / 100,
                    'usermaxcoin' => $usermaxcoin,
                    'shield_rate' => $shieldRate / 100,
                    'highratefix' => $highratefix / 100,
                ]);
                $serviceRet = $this->service->updateConf($value['id'], $conf);
                if ($serviceRet['code'] != 1) {
                    return $this->error($serviceRet['msg'] ?? '');
                }
                return $this->success();
            }
        }
        return $this->error('操作失败');
    }
}
