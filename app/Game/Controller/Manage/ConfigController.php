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

namespace App\Game\Controller\Manage;

use App\Game\Service\GameConfigService;
use Hyperf\Di\Annotation\Inject;
use Hyperf\HttpServer\Annotation\Controller;
use Hyperf\HttpServer\Annotation\DeleteMapping;
use Hyperf\HttpServer\Annotation\GetMapping;
use Hyperf\HttpServer\Annotation\PostMapping;
use Hyperf\HttpServer\Annotation\PutMapping;
use Mine\MineController;
use Mine\MineFormRequest;

#[Controller(prefix: 'game/manage/config')]
class ConfigController extends MineController
{
    #[Inject]
    protected GameConfigService $service;

    #[GetMapping('list')]
    public function list()
    {
        $rulesType = [0 => '默认规则', 1 => '地区', 2 => '性别', 3 => '地区&性别'];
        $sexCfg = [0 => '全部', 1 => '男', 2 => '女'];
        $labelId = [0 => '无标签', 1 => 'Club', 2 => 'Hot', 3 => 'New'];
        $list = [];
        $pre_page_num = 50;
        $data['page_num'] = $pre_page_num;
        $listRe = $this->service->list($data);
        if (! empty($listRe['code']) && $listRe['code'] == 1 && ! empty($listRe['data'])) {
            foreach ($listRe['data'] as $key => $val) {
                $val['rules_type'] = $rulesType[$val['rules_type']];
                $val['is_rules'] = $val['is_rules'] == 1 ? '否' : '是';
                $val['sex_cfg'] = $sexCfg[$val['sex_cfg']];
                $val['label_id'] = $labelId[$val['label_id']];
                $val['is_club'] = $val['is_club'] == 0 ? '不是' : '是';
                $list[$key] = $val;
            }
        }
        return $this->success([
            'items' => $list,
        ]);
    }

    #[GetMapping('list-default')]
    public function listDefault()
    {
        $rulesType = [0 => '默认规则', 1 => '地区', 2 => '性别', 3 => '地区&性别'];
        $sexCfg = [0 => '全部', 1 => '男', 2 => '女'];
        $labelId = [0 => '无标签', 1 => 'Club', 2 => 'Hot', 3 => 'New'];

        $list = [];
        $pre_page_num = 50;
        $data['page_num'] = $pre_page_num;
        $listRe = $this->service->listDefault($data);
        if (! empty($listRe['code']) && $listRe['code'] == 1 && ! empty($listRe['data'])) {
            foreach ($listRe['data'] as $key => $val) {
                $val['rules_type'] = $rulesType[$val['rules_type']];
                $val['is_rules'] = $val['is_rules'] == 1 ? '否' : '是';
                $val['sex_cfg'] = $sexCfg[$val['sex_cfg']];
                $val['label_id'] = $labelId[$val['label_id']];
                $val['is_club'] = $val['is_club'] == 0 ? '不是' : '是';
                $list[$key] = $val;
            }
        }
        return $this->success([
            'items' => $list,
        ]);
    }

    #[GetMapping('show-default')]
    public function showDefault(MineFormRequest $request)
    {
        $all = $request->all();
        $requestData['id'] = ! empty($all['id']) ? $all['id'] : 0;
        $data = [];

        $gamesList = $this->service->gameList($requestData);

        if ($gamesList['code'] == 1) {
            $data['gameList'] = $gamesList['data']['gameList'];
            $data['areaList'] = $gamesList['data']['areaList'];
            $data['info'] = $gamesList['data']['info'];
        }
        return $this->success([
            'list' => $data,
        ]);
    }

    #[PostMapping('add')]
    public function add(MineFormRequest $request)
    {
        $all = $request->all();
        $gamesList = $this->service->saveRule($all);
        return $this->success($gamesList['data'] ?? []);
    }

    #[DeleteMapping('delete-rule')]
    public function deleteRule(MineFormRequest $request)
    {
        $all = $request->all();
        $gamesList = $this->service->deleteRule($all);
        return $this->success($gamesList['data'] ?? []);
    }

    #[PutMapping('add-default')]
    public function addDefault(MineFormRequest $request)
    {
        $all = $request->all();
        $all['game_cfg'] = [$all['game_cfg']];
        $gamesList = $this->service->saveRule($all);

        return $this->success($gamesList['data'] ?? []);
    }


    #[GetMapping('show')]
    public function show(MineFormRequest $request)
    {
        $all = $request->all();
        $requestData['id'] = ! empty($all['id']) ? $all['id'] : 0;
        $data = [];

        $gamesList = $this->service->gameList($requestData);

        if ($gamesList['code'] == 1) {
            $data['gameList'] = $gamesList['data']['gameList']??[];
            $data['areaList'] = $gamesList['data']['areaList']??[];
            $data['info'] = $gamesList['data']['info']??[];
        }

        return $this->success([
            'ret' => $data,
        ]);
    }

    #[PutMapping('game-status-update')]
    public function gameStatusUpdate(MineFormRequest $request)
    {
        $all = $request->all();
        return $this->service->gameStatusUpdate($all) ? $this->success() : $this->error($this->service->getErrMsg());
    }

    #[PutMapping('sort-update')]
    public function sortUpdate(MineFormRequest $request)
    {
        $all = $request->all();
        return $this->service->sortUpdate($all) ? $this->success() : $this->error($this->service->getErrMsg());
    }

    #[GetMapping('from-game')]
    public function fromGame(MineFormRequest $request)
    {
        $list = [];
        $data = $request->all();
        $data['page'] = isset($data['page']) ? (int) $data['page'] : 1;
        $data['page_size']=isset($data['pageSize']) ? (int) $data['pageSize'] : 50;
        if (! isset($data['from_type'])) {
            $data['from_type'] = 1;
        }

        $gamesList = $this->service->fromGame($data);
        if ($gamesList['code'] == 1) {
            $list['game_list'] = $gamesList['data']['game_list'];
        }

        return $this->success([
            'items' => $list['game_list']??[],
            'pageInfo' => [
                'total' => (int) $gamesList['data']['count'],
                'currentPage' => (int)  $data['page'],
                'totalPage' => ceil($gamesList['data']['count'] / $data['page_size']),
            ],
            'from_type' => $data['from_type']
        ]);
    }
}
